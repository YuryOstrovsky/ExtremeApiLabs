cd xiq-studio/
vi static/index.html 
cp app.py app.py.bak
vi app.py
sudo systemctl restart xiq-studio.service
sudo journalctl -u xiq-studio.service -f
vi app.py
sudo systemctl restart xiq-studio.service
sudo journalctl -u xiq-studio.service -f
vi app.py
vi static/index.html 
./push_to_github.sh 
vi app.py
sudo systemctl restart xiq-studio.service
sudo journalctl -u xiq-studio.service -f
./push_to_github.sh 
vi static/index.html 
vi app.py
grep -n "repair_system" app.py
grep -n "auto_fix_.*(answer, system" app.py
vi app.py
sudo systemctl restart xiq-studio.service
sudo journalctl -u xiq-studio.service -f
./push_to_github.sh 
cd ..
git status
git restore --staged .
git clean -nd
git clean -fd
git clean -fdx
ls
more ls -al
ls -al
pwd
sudo updatedb
cd Jupyter_Docker_Container/
ls
cd ..
sudo apt install -y plocate
ls -al
more wsgi.py 
ls -l
cd xiq-studio/
ls
cd ..
mkdir -p ~/.ssh
chmod 700 ~/.ssh
vi ~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys
ls -al
mv apilabs.extremewireless.ca_key.txt key.pem
mv apilabs.extremewireless.ca.crt cert.pem
systemctl list-units --type=service
sudo systemctl start lab.service
systemctl status lab.service
ls
mv apilabs.extremewireless.ca.ca-bundle cert.pem
sudo systemctl start lab.service
journalctl -xeu lab.service
sudo systemctl start lab.service
systemctl status lab.service
ls -al
ls
mv apilabs.extremewireless.ca.crt cert.pem
sudo systemctl start lab.service
ls
mv apilabs.extremewireless.ca.ca-bundle cert.pem
sudo systemctl start lab.service
systemctl status lab.service
ls -al
more cert.pem 
more key.pem 
ls
rm cert.pem 
rm key.pem 
ls -al
ls
mv apilabs.extremewireless.ca.ca-bundle cert.pem
sudo systemctl start lab.service
ls -al
sudo systemctl start lab.service
systemctl status lab.service
systemctl cat lab.service
sudo chown jupyter:jupyter /home/jupyter/cert.pem /home/jupyter/key.pem
sudo chmod 644 /home/jupyter/cert.pem
sudo chmod 600 /home/jupyter/key.pem
openssl x509 -noout -modulus -in /home/jupyter/cert.pem | openssl md5
openssl rsa  -noout -modulus -in /home/jupyter/key.pem  | openssl md5
ls
mv apilabs.extremewireless.ca.crt cert.pem 
openssl x509 -noout -modulus -in /home/jupyter/cert.pem | openssl md5
sudo systemctl start lab.service
sudo chmod 644 /home/jupyter/cert.pem
sudo systemctl start lab.service
systemctl status lab.service
ls
more ports.txt 
sudo tee /etc/systemd/system/lab.service >/dev/null <<'EOF'
[Unit]
Description=My Flask Application
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=jupyter
Group=jupyter
WorkingDirectory=/home/jupyter
ExecStartPre=/bin/bash -c 'echo "8888" > /home/jupyter/ports.txt'

# Use a venv path for reliability (we'll create it next)
ExecStart=/home/jupyter/venv/bin/gunicorn \
  -k uvicorn.workers.UvicornWorker \
  -c /home/jupyter/gunicorn.conf.py \
  --limit-request-line 8190 \
  --bind 0.0.0.0:5000 \
  --certfile=/home/jupyter/cert.pem \
  --keyfile=/home/jupyter/key.pem \
  app:app

Restart=always
RestartSec=3
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

sudo -u jupyter -H bash -lc '
python3 -m venv ~/venv
~/venv/bin/pip install --upgrade pip gunicorn uvicorn
~/venv/bin/gunicorn --version
'
ls
more wsgi.py 
vi wsgi.py 
sudo tee /etc/systemd/system/lab.service >/dev/null <<'EOF'
[Unit]
Description=My Flask Application
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
User=jupyter
Group=jupyter
WorkingDirectory=/home/jupyter
Environment=PYTHONUNBUFFERED=1
ExecStartPre=/bin/bash -c 'echo "8888" > /home/jupyter/ports.txt'
ExecStart=/home/jupyter/venv/bin/python /home/jupyter/wsgi.py
Restart=always
RestartSec=3
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl daemon-reload
sudo systemctl restart lab.service
sudo systemctl status lab.service
journalctl -u lab.service -n 100 --no-pager
sudo -u jupyter -H bash -lc '/home/jupyter/venv/bin/python /home/jupyter/wsgi.py'
sudo -u jupyter -H bash -lc '
/home/jupyter/venv/bin/pip install --upgrade pip
/home/jupyter/venv/bin/pip install requests flask
/home/jupyter/venv/bin/python -c "import requests, flask; print(\"OK: \", requests.__version__, flask.__version__)"
'
sudo -u jupyter -H bash -lc '/home/jupyter/venv/bin/pip install python-dotenv pydantic'
vi requirements.txt
cat > /home/jupyter/requirements.txt <<'EOF'
flask
requests
# add others your app imports:
# python-dotenv
# pydantic
# gunicorn
EOF

sudo -u jupyter -H bash -lc '/home/jupyter/venv/bin/pip install -r /home/jupyter/requirements.txt'
sudo systemctl restart lab.service
sudo systemctl status lab.service
journalctl -u lab.service -n 50 --no-pager
sudo -u jupyter -H bash -lc '
/home/jupyter/venv/bin/pip install --upgrade pip
/home/jupyter/venv/bin/pip install flask requests jsonpickle python-dotenv
/home/jupyter/venv/bin/python -c "import flask,requests,jsonpickle; print(\"OK:\", flask.__version__, requests.__version__, jsonpickle.__version__)"
'
sudo systemctl restart lab.service
journalctl -u lab.service -n 50 --no-pager
sudo -u jupyter -H bash -lc '
/home/jupyter/venv/bin/pip install --upgrade pip
/home/jupyter/venv/bin/pip install flask requests jsonpickle python-dotenv docker
/home/jupyter/venv/bin/python -c "import flask,requests,jsonpickle,docker; print(\"OK:\", flask.__version__, requests.__version__, jsonpickle.__version__, docker.__version__)"
'
sudo usermod -aG docker jupyter
sudo sed -i '/^\[Service\]/a SupplementaryGroups=docker' /etc/systemd/system/lab.service
ls -l /var/run/docker.sock
sudo systemctl daemon-reload
sudo systemctl restart lab.service
sudo systemctl status lab.service
journalctl -u lab.service -n 50 --no-pager
sudo systemctl restart lab.service
journalctl -u lab.service -n 50 --no-pager
sudo -u jupyter -H bash -lc '
/home/jupyter/venv/bin/pip install --upgrade pip
/home/jupyter/venv/bin/pip install docker
/home/jupyter/venv/bin/python -c "import docker; print(\"docker SDK:\", docker.__version__)"
'
sudo usermod -aG docker jupyter
sudo sed -i '/^\[Service\]/a SupplementaryGroups=docker' /etc/systemd/system/lab.service
ls -l /var/run/docker.sock
sudo chgrp docker /var/run/docker.sock
sudo chmod 660 /var/run/docker.sock
sudo systemctl daemon-reload
sudo systemctl restart lab.service
sudo systemctl status lab.service
journalctl -u lab.service -n 50 --no-pager
ss -ltnp | grep :5000
cd Jupyter_Docker_Container/
ls
more Dockerfile 
cat Dockerfile |grep pem
vi Dockerfile 
cp ../cert.pem mycert.pem
cp ../key.pem mykey.key
ls -al
vi Dockerfile 
cd ..
vi ~/.xiq-studio.env
ls
vi .xiq-studio.env 
systemctl list-units --type=service --all
sudo reboot
cd xiq-studio/
clear
cat app.py
clear
cat app.py
clear
cat app.py
openssl rand -base64 48
ls
ls -al
more .xiq-studio.env 
sudo journalctl -u xiq-studio.service -f
vi .xiq-studio.env 
sudo systemctl restart xiq-studio
sudo journalctl -u xiq-studio.service -f
more .xiq-studio.env 
vi .xiq-studio.env 
sudo systemctl restart xiq-studio
sudo journalctl -u xiq-studio.service -f
sudo reboot
