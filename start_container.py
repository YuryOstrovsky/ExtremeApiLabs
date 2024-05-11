import subprocess
import time

def get_last_port_number(filename):
    try:
        with open(filename, 'r') as f:
            lines = f.readlines()
            if lines:
                last_line = lines[-1].strip()
                last_number = int(last_line)
                return last_number
            else:
                return None
    except FileNotFoundError:
        return None

def write_new_port_number(filename, new_number):
    with open(filename, 'a+') as f:
        f.seek(0)
        lines = f.readlines()
        if lines:
            last_line = lines[-1].strip()
            last_number = int(last_line)
            if new_number > last_number:
                f.write(str(new_number) + '\n')
            else:
                print("New port number should be greater than the last one.")
        else:
            f.write(str(new_number) + '\n')

def get_jupyter_info():
    # Read the last port number from ports.txt and add 1
    port_number = get_last_port_number('ports.txt')
    if port_number is None:
        port_number = 8888  # Default port number
    else:
        port_number += 1

    # Define internal port
    internal_port = 8888

    # Write the new port number to ports.txt
    write_new_port_number('ports.txt', port_number)

    # Run the Docker container in the background
    docker_process = subprocess.Popen(f'docker run -p {port_number}:{internal_port} my_jupyter_image', shell=True, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)

    # Wait for a while to allow the container to start up
    time.sleep(10)  # Adjust this as needed based on your container's startup time

    # Check the output of the Docker container
    found = False
    token = None
    for line in iter(docker_process.stdout.readline, b''):
        line = line.decode('utf-8').strip()
        print(line)  # Optionally print the container's output for debugging
        if "http://127.0.0.1:" in line:
            found = True
            print("Found the string:", line)
            # Extract the token from the found string
            token_start = line.find("token=") + len("token=")
            token = line[token_start:]
            print("Jupyter token:", token)
            break

    if not found:
        print("String not found in the Docker container's output.")

    # Print the port and token before returning
    print("Jupyter port number:", port_number)
    print("Jupyter token:", token)
    
    return port_number, token

# Call the function to get the Jupyter port number and token
jupyter_port, jupyter_token = get_jupyter_info()
#print("Jupyter port number:", jupyter_port)
#print("Jupyter token:", jupyter_token)

