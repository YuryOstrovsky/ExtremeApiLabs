#/usr/bin/bash
cd /home/jupyter
/usr/bin/echo "8888" >/home/jupyter/ports.txt
#/usr/bin/python3 app.py
/home/jupyter/.local/bin/gunicorn -c /home/jupyter/gunicorn.conf.py --limit-request-line 8190  --bind 0.0.0.0:5000 --certfile=/home/jupyter/cert.pem --keyfile=/home/jupyter/key.pem wsgi:app

