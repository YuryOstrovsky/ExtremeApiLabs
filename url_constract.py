import subprocess
import sys

HOSTNAME = "apilabs.extremewireless.ca"


def get_jupyter_notebook_url():
    # Call start_container.py to get port number and token
    result = subprocess.run(
        ["python3", "start_container.py"],
        capture_output=True,
        text=True
    )

    if result.returncode != 0:
        raise RuntimeError(
            f"start_container.py failed with code {result.returncode}:\n"
            f"STDOUT:\n{result.stdout}\n\nSTDERR:\n{result.stderr}"
        )

    jupyter_port = None
    jupyter_token = None

    for line in result.stdout.splitlines():
        line = line.strip()
        if line.startswith("Jupyter port number:"):
            jupyter_port = line.split(":", 1)[1].strip()
        elif line.startswith("Jupyter token:"):
            jupyter_token = line.split(":", 1)[1].strip()

    if not jupyter_port or not jupyter_token or jupyter_token.lower() == "none":
        raise RuntimeError(
            "Could not parse valid port/token from start_container.py output.\n"
            f"Raw output:\n{result.stdout}"
        )

    # Construct the URL using port number and token
    url = (
        f"https://{HOSTNAME}:{jupyter_port}"
        "/notebooks/work/mynotebook.ipynb"
        f"?token={jupyter_token}"
    )
    return url


if __name__ == "__main__":
    try:
        jupyter_notebook_url = get_jupyter_notebook_url()
        print(jupyter_notebook_url)
    except Exception as e:
        print(f"ERROR: {e}", file=sys.stderr)
        sys.exit(1)

