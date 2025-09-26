import os
import time
import logging
from logging.handlers import RotatingFileHandler
from urllib.parse import urlparse, parse_qs

import requests
import jsonpickle
from flask import Flask, render_template, request, send_from_directory, session, jsonify
import subprocess

from count_images import count_containers

# -----------------------------------------------------------------------------
# Logging
# -----------------------------------------------------------------------------
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

file_handler = RotatingFileHandler('app.log', maxBytes=1024*1024, backupCount=10)
file_handler.setLevel(logging.DEBUG)
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
file_handler.setFormatter(formatter)
logger.addHandler(file_handler)

# -----------------------------------------------------------------------------
# Flask
# -----------------------------------------------------------------------------
app = Flask(__name__, static_url_path='/static')

# Session secret (required to use Flask session cookies)
# Set FLASK_SECRET in the environment if you want a stable secret across restarts.
app.secret_key = os.environ.get("FLASK_SECRET", "dev-only-change-me")
# (Optional hardening)
app.config.update(SESSION_COOKIE_SAMESITE="Lax")

# -----------------------------------------------------------------------------
# Routes
# -----------------------------------------------------------------------------
@app.route('/')
def home():
    logging.debug('Rendering home page')
    # Count containers
    image_name = "my_jupyter_image"
    tag = "latest"
    num_containers = count_containers(image_name, tag)
    num_available = 50 - num_containers

    if num_containers > 50:
        return render_template('index.html', not_allowed=True, num_containers=num_containers)
    else:
        template_name = request.args.get('template', 'index')
        if template_name == 'index':
            return render_template('index.html', not_allowed=False, num_available=num_available)
        elif template_name == 'tutorial':
            return render_template('tutorial.html')
        else:
            return "Invalid template name", 400

@app.route('/tutorial.html')
def tutorial():
    logging.debug('Rendering tutorial page')
    return send_from_directory('static', 'tutorial.html')

@app.route('/XIQClass')
def xiq_class():
    return send_from_directory('static', 'XIQClass.html')

@app.route('/XIQCClass')
def xiqc_class():
    return send_from_directory('static', 'XIQCClass.html')

@app.route('/XIQSEClass')
def xiqse_class():
    return send_from_directory('static', 'XIQSEClass.html')

# -----------------------------------------------------------------------------
# /runscript — starts the user’s Jupyter container and returns its URL
# ALSO: parses and remembers Jupyter base + token in the session for later injects
# -----------------------------------------------------------------------------
@app.route('/runscript', methods=['POST'])
def run_script():
    try:
        output = subprocess.check_output(
            ["python3", "url_constract.py"],
            stderr=subprocess.STDOUT,
            universal_newlines=True
        ).strip()

        logging.info('Script executed successfully')
        print(output)

        # The script typically returns a quoted URL string. Normalize it:
        cleaned = output
        if cleaned.startswith('"') and cleaned.endswith('"'):
            cleaned = cleaned[1:-1]

        # Try to parse Jupyter URL and stash base+token in the session
        try:
            u = urlparse(cleaned)
            q = parse_qs(u.query)
            token = (q.get("token") or [""])[0]
            base = f"{u.scheme}://{u.netloc}" if u.scheme and u.netloc else ""
            if base and token:
                session['jupyter'] = {"base": base, "token": token}
                logging.info(f"[session] Saved Jupyter base={base}")
            else:
                logging.warning(f"[session] Could not parse base/token from URL: {cleaned}")
        except Exception as e:
            logging.exception(f"[session] Failed to parse Jupyter URL from {cleaned}: {e}")

        # Keep your existing response format (jsonpickle-encoded string)
        return jsonpickle.encode(output)
    except subprocess.CalledProcessError as e:
        logging.error('Error executing script: %s', e.output)
        print("Error executing url_constract.py:", e.output)
        return jsonpickle.encode({"error": str(e)}), 500

# -----------------------------------------------------------------------------
# /notebook/inject — create a new notebook with the provided code (from Studio)
# Returns a URL to open in the left iframe.
# -----------------------------------------------------------------------------
@app.post("/notebook/inject")
def notebook_inject():
    j = session.get("jupyter")
    if not j:
        return jsonify({
            "ok": False,
            "error": "No Jupyter session. Click 'Create my own API environment' first."
        }), 409

    data = request.get_json(silent=True) or {}
    code = (data.get("code") or "").rstrip()
    if not code:
        return jsonify({"ok": False, "error": "no code"}), 400

    base = j.get("base")
    token = j.get("token")
    if not base or not token:
        return jsonify({"ok": False, "error": "session missing base/token"}), 409

    # Create a simple notebook with one markdown cell + one code cell
    nb_name = f"Studio_{int(time.time())}.ipynb"
    nb = {
        "cells": [
            {
                "cell_type": "markdown",
                "metadata": {},
                "source": "# XIQ Script Studio · generated cell\n"
            },
            {
                "cell_type": "code",
                "metadata": {},
                "source": code,
                "outputs": [],
                "execution_count": None
            }
        ],
        "metadata": {
            "kernelspec": {"display_name": "Python 3", "language": "python", "name": "python3"},
            "language_info": {"name": "python"}
        },
        "nbformat": 4,
        "nbformat_minor": 5
    }

    url = f"{base}/api/contents/{nb_name}"
    try:
        try:
            r = requests.put(
                url,
                params={"token": token},
                json={"type": "notebook", "format": "json", "content": nb},
                timeout=15,
            )
        except requests.exceptions.SSLError:
            # Retry without cert verification if your Jupyter uses self-signed TLS
            r = requests.put(
                url,
                params={"token": token},
                json={"type": "notebook", "format": "json", "content": nb},
                timeout=15,
                verify=False,
            )

        if r.status_code not in (200, 201):
            logging.error("Create notebook failed: %s %s", r.status_code, r.text)
            return jsonify({"ok": False, "error": f"create failed: {r.status_code} {r.text}"}), 500

        # Open with classic Notebook; swap to /lab/tree/... if you prefer JupyterLab
        open_url = f"{base}/notebooks/{nb_name}?token={token}"
        return jsonify({"ok": True, "url": open_url, "name": nb_name})
    except Exception as e:
        logging.exception("Error talking to Jupyter Contents API")
        return jsonify({"ok": False, "error": str(e)}), 500

# -----------------------------------------------------------------------------
# (You run this via gunicorn; leaving the dev server disabled)
# -----------------------------------------------------------------------------
# if __name__ == '__main__':
#     app.run(debug=False, port=5000, host='0.0.0.0')

