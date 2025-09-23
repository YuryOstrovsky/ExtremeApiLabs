# Stage 1: Build and install dependencies
FROM python:3.9 AS builder

# Install necessary packages (including nodejs, npm, and gcc)
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        nodejs \
        npm \
        gcc \
        g++ \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Upgrade pip and install requirements
RUN /usr/local/bin/python3 -m pip install --upgrade pip
COPY requirements.txt .
RUN pip install -r requirements.txt

# Install additional Python package
RUN pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple --upgrade pyxccsdk
RUN rm requirements.txt

# Install Jupyter
RUN pip install jupyter

# Generate Jupyter notebook configuration file
RUN jupyter notebook --generate-config && \
    echo "c.NotebookApp.tornado_settings = {'headers': {'Content-Security-Policy': \"frame-ancestors *\"}}" >> /root/.jupyter/jupyter_notebook_config.py 

# Ensure the notebook config directory exists
RUN mkdir -p /home/jovyan/.jupyter/nbconfig/

# Copy the notebook.json file into the appropriate directory
COPY notebook.json /home/jovyan/.jupyter/nbconfig/notebook.json

# Copy SSL certificates
COPY mycert.pem /etc/ssl/certs/mycert.pem
COPY mykey.key /etc/ssl/certs/mykey.key

# Verify that SSL files exist and set permissions
RUN test -f /etc/ssl/certs/mycert.pem && \
    test -f /etc/ssl/certs/mykey.key && \
    chmod 600 /etc/ssl/certs/mycert.pem && \
    chmod 600 /etc/ssl/certs/mykey.key

# Add SSL and port configuration to Jupyter config
RUN echo "c.NotebookApp.certfile = u'/etc/ssl/certs/mycert.pem'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.keyfile = u'/etc/ssl/certs/mykey.key'" >> /root/.jupyter/jupyter_notebook_config.py && \
    echo "c.NotebookApp.port = 8888" >> /root/.jupyter/jupyter_notebook_config.py

# Set autosave interval to 10 minutes (600000 milliseconds)
RUN echo "c.ContentsManager.autosave_interval = 600000" >> /root/.jupyter/jupyter_notebook_config.py

# Increase checkpoint interval to 10 minutes
RUN echo "c.FileCheckpoints.checkpoint_interval = 600" >> /root/.jupyter/jupyter_notebook_config.py


# Stage 2: Create the final Jupyter image
FROM jupyter/base-notebook:latest

# Switch to root user to install dependencies
USER root

# Install GCC in the final image
RUN apt-get update && \
    apt-get install -y gcc g++ && \
    rm -rf /var/lib/apt/lists/*

# Upgrade pip and install pyxccsdk in the final stage
RUN pip install --upgrade pip
RUN pip install --index-url https://test.pypi.org/simple/ --extra-index-url https://pypi.org/simple --upgrade pyxccsdk
RUN pip install pandas
RUN pip install pytest
RUN pip install matplotlib==3.9.2


# Copy the installed packages and environment from the builder stage
COPY --from=builder /usr/local/lib/python3.9/site-packages /usr/local/lib/python3.9/site-packages
COPY --from=builder /usr/local/bin /usr/local/bin

# Copy Jupyter configuration from the builder stage
COPY --from=builder /root/.jupyter/jupyter_notebook_config.py /home/jovyan/.jupyter/
COPY --from=builder /home/jovyan/.jupyter/nbconfig/notebook.json /home/jovyan/.jupyter/nbconfig/notebook.json

# Copy SSL certificates
COPY --from=builder /etc/ssl/certs/mycert.pem /etc/ssl/certs/mycert.pem
COPY --from=builder /etc/ssl/certs/mykey.key /etc/ssl/certs/mykey.key

# Verify that SSL files exist and set permissions
RUN test -f /etc/ssl/certs/mycert.pem && \
    test -f /etc/ssl/certs/mykey.key && \
    chmod 600 /etc/ssl/certs/mycert.pem && \
    chmod 600 /etc/ssl/certs/mykey.key

# Ensure permissions are set correctly for the jovyan user
RUN chown -R jovyan:users /home/jovyan/.jupyter
RUN chown jovyan:users /etc/ssl/certs/mycert.pem /etc/ssl/certs/mykey.key

# Create a file named mynotebook.ipynb with some initial content
USER jovyan
RUN echo '{"cells": [], "metadata": {"kernelspec": {"display_name": "Python 3", "language": "python", "name": "python3"}, "language_info": {"codemirror_mode": {"name": "ipython", "version": 3}, "file_extension": ".py", "mimetype": "text/x-python", "name": "python", "nbconvert_exporter": "python", "pygments_lexer": "ipython3", "version": "3.9.2"}}, "nbformat": 4, "nbformat_minor": 5}' > /home/jovyan/work/mynotebook.ipynb


# Copy the configuration check script
COPY verify_config.py /home/jovyan/verify_config.py


# Expose the port the Jupyter notebook server is running on
EXPOSE 8888

# Command to run the Jupyter notebook server
CMD ["jupyter", "notebook", "--NotebookApp.hide_menubar=True", "--ip=0.0.0.0"]

