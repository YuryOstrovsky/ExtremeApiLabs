import logging
from logging.handlers import RotatingFileHandler
from flask import Flask, render_template, request, send_from_directory
import subprocess
import jsonpickle

from count_images import count_containers

# Configure logging
logger = logging.getLogger()
logger.setLevel(logging.DEBUG)

# Create a file handler and set its level to DEBUG
file_handler = RotatingFileHandler('app.log', maxBytes=1024*1024, backupCount=10)
file_handler.setLevel(logging.DEBUG)

# Create a formatter and set it for the file handler
formatter = logging.Formatter('%(asctime)s - %(name)s - %(levelname)s - %(message)s')
file_handler.setFormatter(formatter)

# Add the file handler to the logger
logger.addHandler(file_handler)

app = Flask(__name__, static_url_path='/static')

@app.route('/')
def home():
    logging.debug('Rendering home page')
    # Call the function to count containers
    image_name = "my_jupyter_image"
    tag = "latest"  # Update this with the actual tag
    num_containers = count_containers(image_name, tag)
    num_available = 50 - num_containers
    
    # Check if the number of containers is more than 50
    if num_containers > 50 :
        return render_template('index.html', not_allowed=True, num_containers=num_containers)
    else:
        #    return render_template('index.html')
        template_name = request.args.get('template', 'index')
        if template_name == 'index':
            return render_template('index.html', not_allowed=False, num_available=num_available)
        elif template_name == 'tutorial':
            return render_template('tutorial.html')
        else:
            return "Invalid template name"

@app.route('/tutorial.html')
def tutorial():
    logging.debug('Rendering tutorial page')
    return send_from_directory('static', 'tutorial.html')

@app.route('/XIQClass')
def xiq_class():
    return send_from_directory('static','XIQClass.html')

@app.route('/XIQCClass')
def xiqc_class():
    return send_from_directory('static','XIQCClass.html')

@app.route('/XIQSEClass')
def xiqse_class():
    return send_from_directory('static','XIQSEClass.html')


@app.route('/runscript', methods=['POST'])
def run_script():
    try:
        output = subprocess.check_output(["python3", "url_constract.py"], stderr=subprocess.STDOUT, universal_newlines=True)
        output = output.strip()
        logging.info('Script executed successfully')
        print(output)
        return jsonpickle.encode(output)
    except subprocess.CalledProcessError as e:
        logging.error('Error executing script: %s', e.output)
        print("Error executing chat2.py:", e.output)
        return jsonpickle.encode({"error": str(e)})

# Remove this part as it will be handled by Gunicorn
# if __name__ == '__main__':
#     context = ('cert.pem', 'key.pem')  # Path to your certificate and key files
#     app.run(debug=False, port=5000, host='0.0.0.0', ssl_context=context)

