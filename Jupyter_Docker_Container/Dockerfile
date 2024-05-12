# Stage 1: Generate Jupyter notebook configuration file
FROM python:3.9 AS builder

# node.js is used by some Jupyter extensions
RUN apt update
RUN apt install -y nodejs
RUN apt install -y npm

RUN /usr/local/bin/python3 -m pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt
RUN pip install -i https://test.pypi.org/simple/ extreme-venue-sdk
RUN rm requirements.txt

# Copy the notebook.json file into the appropriate directory
RUN mkdir -p /home/jovyan/.jupyter/nbconfig/
COPY notebook.json /home/jovian/.jupyter/nbconfig/notebook.json



RUN pip install jupyter

RUN jupyter notebook --generate-config && \
    echo "c.NotebookApp.tornado_settings = {'headers': {'Content-Security-Policy': \"frame-ancestors *\"}}" >> /root/.jupyter/jupyter_notebook_config.py

# Stage 2: Final image with Jupyter notebook and generated config
FROM jupyter/base-notebook:latest

COPY --from=builder /root/.jupyter/jupyter_notebook_config.py /home/jovyan/.jupyter/

# Create a file named mynotebook.ipynb with some initial content
RUN echo '{"cells": [], "metadata": {"kernelspec": {"display_name": "Python 3", "language": "python", "name": "python3"}, "language_info": {"codemirror_mode": {"name": "ipython", "version": 3}, "file_extension": ".py", "mimetype": "text/x-python", "name": "python", "nbconvert_exporter": "python", "pygments_lexer": "ipython3", "version": "3.9.2"}}, "nbformat": 4, "nbformat_minor": 5}' > /home/jovyan/work/mynotebook.ipynb

# Expose the port the Jupyter notebook server is running on
EXPOSE 8888

# Command to run the Jupyter notebook server
CMD ["sh", "-c", "jupyter notebook --NotebookApp.hide_menubar=True --ip=0.0.0.0"]

