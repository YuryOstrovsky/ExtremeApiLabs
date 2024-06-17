# gunicorn.conf.py

import logging
import ssl

bind = "0.0.0.0:5000"
workers = 3
worker_class = 'sync'
timeout = 120
loglevel = 'info'
accesslog = '-'
errorlog = '-'

# SSL/TLS settings
certfile = '/home/jupyter/cert.pem'
keyfile = '/home/jupyter/key.pem'


