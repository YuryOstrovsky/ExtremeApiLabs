#!/bin/bash

export PYTHONPATH=/usr/bin

# Get the current date and time
current_date=$(/usr/bin/date)

# Run your script and capture its output
script_output=$(/usr/bin/python3 /home/jupyter/count_images.py | /usr/bin/awk -F: '{print $3}')


# Log the date and script output into the same line
echo "$current_date - $script_output" >> /home/jupyter/number_of_containers.log

