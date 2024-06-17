import os

config_path = os.path.expanduser("~/.jupyter/jupyter_notebook_config.py")

print("Configuration File Content:")
with open(config_path, 'r') as file:
    for line in file:
        print(line.strip())

