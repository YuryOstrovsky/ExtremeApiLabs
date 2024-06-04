import subprocess

def get_jupyter_notebook_url():
    # Call start_container.py to get port number and token
    result = subprocess.run(['python3', 'start_container.py'], capture_output=True, text=True)
    output = result.stdout.strip().split('\n')
    jupyter_port, jupyter_token = output[-2].split(": ")[1], output[-1].split(": ")[1]

    # Construct the URL using port number and token
    url = f"https://apilabs.extremewireless.ca:{jupyter_port}/notebooks/work/mynotebook.ipynb?token={jupyter_token}"
    return url

if __name__ == "__main__":
    jupyter_notebook_url = get_jupyter_notebook_url()
    print(jupyter_notebook_url)
