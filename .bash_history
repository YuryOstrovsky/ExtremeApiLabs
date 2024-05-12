whoami
ls -ltr
pwd
ls -al
ssh-keygen -b 4096
cd .ssh
ls al
ls -al
more id_rsa.pub
vi id_rsa.pub 
ls -al
vi id_rsa
ls
exit
docker image ls
exit
docker image ls
exit
docker image ls
sudo ls
sudo apt-get update
whoami
more /etc/sudoers
sudo more /etc/sudoers
sudo more /etc/group
sudo /etc/passwd
sudo more /etc/passwd
docker image ls
docker run -p 8888:8888:my_jupyter_image
docker run -p 8888:8888 my_jupyter_image
ls
ls -al
vi app.py
vi url_constract
vi app.py
mv url_constract url_constract.py
vi app.py
vi start_container.py
vi url_constract.py 
touch ports.txt
vi start_lab.sh
which python3
chmnod 755 start_lab.sh 
chmod 755 start_lab.sh 
mkdir static
cd static/
vi tutorial.html
vi XIQCClass.html
vi XIQClass.html
vi XIQSEClass.html
ls
cd ..
mkdir templates
cd templates/
vi index.html
cd ..
more app.py 
pip3 install Flask
python3 -m flask --version 
more app.py 
pip3 install -U jsonpickle
more app.py 
ls
more start_container.py 
ls
more url_constract.py 
python3 app.py 
./start_lab.sh 
ls
vi url_constract.py 
./start_lab.sh 
vi url_constract.py 
./start_lab.sh 
ls
pwd
more start_lab.sh 
sudo vi /etc/systemd/system/lab.service
sudo chmod 664 /etc/systemd/system/lab.service 
sudo systemctl daemon-reload
sudo systemctl enable lab.service
sudo reboot
ls
cp app.py app.py.orig
cp start_container.py start_container.py.orig
cp url_constract.py url_constract.py.orig
hostname
hostnamectl
sudo hostnamectl set-hostname apilabs.extremewireless.ca
hostname
exit
pwd
mkdir certs
cd certs
vi private-key.key
vi certificate.crt
cd ..
vi app.py
more /home/jupyter/certs/private-key.key
sudo reboot
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
cd certs/
ls
rm certificate.crt 
vi certificate.crt
cd ..
python3 app.py 
cd certs/
ls
vi private-key.key 
ls
rm certificate.crt 
vi certificate.crt
cd ..
python3 app.py 
cd certs/
ls -al
vi cert_test.py
python3 cert_test.py 
rm certificate.crt 
vi certificate.crt
python3 cert_test.py 
cd ..
python3 app.py 
more certs/cert_test.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
hwinfo
ip link
sudo apt install hwinfo
hwinfo
ifconfig
sudo apt install net-tools
ifconfig
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
pwd
python3 app.py 
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
python3 app.py 
su - yostrovs
ls
pwd
cd certs
ls
cd ..
python3 app.py 
vi app.py
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
python3 app.py 
vi app.py
python3 app.py 
vi app.py
ls certs
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
ls -ltr
tail -f app.log
cd certs/
ls
python3 cert_test.py 
cd ..
vi app.py
python3 cert_test.py 
python3 app.py 
cd certs/
openssl x509 -in certificate.crt -text -noout
openssl rsa -in private-key.key -text -noout
vi certificate.crt 
mv certificate.crt_only_cert
mv certificate.crt certificate.crt.short
vi certificate.crt
openssl x509 -in certificate.crt -text -noout
cd ..
python3 app.py 
vi app.py
python3 app.py 
cd certs/
ls
mv certificate.crt certificate.crt.long
cp certificate.crt.short certificate.crt
cd ..
python3 app.py 
vi app.py
python3 app.py 
vi app.py
python3 app.py 
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo apt update
sudo apt install nginx
sudo vi /etc/nginx/sites-available/flask
sudo ln -s /etc/nginx/sites-available/flask /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl reload nginx
python3 app.py 
su - yostrovs
su - extreme-api-labs
more /etc/passwd
su - plm_extreme_api_labs
python3 app.py 
ls
ls -ltr
tail 0f app.log 
tail -f app.log 
ls
vi url_constract.py
vi start_container.py
ls
cp app.py.orig app.py
cp start_container.py.orig start_container.py
cp url_constract.py.orig url_constract.py
sudo reboot
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo systemctl stop nginx
ls
vi url_constract.py
sudo reboot
sudo vi /etc/nginx/sites-available/flask
sudo systemctl reload nginx
sudo vi /etc/nginx/sites-available/flask
sudo vi /etc/nginx/nginx.conf
sudo ln -s /etc/nginx/sites-available/flask /etc/nginx/sites-enabled/
sudo cp /etc/nginx/sites-available/flask /etc/nginx/sites-available/myflaskapp
sudo vi /etc/nginx/sites-available/myflaskapp
sudo ln -s /etc/nginx/sites-available/myflaskapp /etc/nginx/sites-enabled/
sudo nginx -t
sudo vi /etc/nginx/sites-available/myflaskapp
sudo nginx -t
sudo vi /etc/nginx/sites-available/flask 
sudo nginx -t
sudo rm /etc/nginx/sites-available/flask 
sudo nginx -t
sudo cp /etc/nginx/sites-available/myflaskapp /etc/nginx/sites-available/flask 
sudo nginx -t
sudo vi /etc/nginx/sites-available/flask 
sudo nginx -t
sudo systemctl reload nginx
sudo reboot
sudo vi /etc/nginx/sites-available/flask 
sudo systemctl reload nginx
sudo vi /etc/nginx/sites-available/flask 
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo iptables -D PREROUTING -t nat -i eth0 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo iptables -D PREROUTING -t nat -i eth0 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo vi /etc/nginx/sites-available/myflaskapp 
sudo systemctl reload nginx
more app.py
sudo vi /etc/nginx/sites-available/myflaskapp 
sudo systemctl reload nginx
sudo reboot
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo iptables -D PREROUTING -t nat -i ens4 -p tcp --dport 443 -j REDIRECT --to-port 5000
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo iptables-save > /etc/iptables/rules.v4
sudo mkdir -p /etc/iptables
sudo iptables-save > /etc/iptables/rules.v4
sudo iptables-save | sudo tee /etc/iptables/rules.v4
sudo vi /etc/systemd/system/iptables-restore.service
sudo systemctl enable iptables-restore.service
sudo reboot
sudo iptables-save
sudo iptables-save -t nat
sudo systemctl status iptables
sudo systemctl status firewalld
sudo systemctl list-units --type=service | grep firewall
vi /etc/systemd/system/iptables-restore.service
sudo systemctl status iptables-restore.service
sudo vi /etc/systemd/system/iptables-restore.service
sudo /sbin/iptables-restore < /etc/iptables/rules.v4
sudo vi /etc/systemd/system/iptables-restore.service
sudo systemctl restart iptables-restore.service
sudo systemctl status iptables-restore.service
sudo vi /etc/systemd/system/iptables-restore.service
/sbin/iptables-restore < /etc/iptables/rules.v4
ls /lib/modules/$(uname -r)/kernel/net/netfilter/
sudo modprobe nf_conntrack
lsmod | grep nf_conntrack
ls /lib/modules/$(uname -r)/kernel/net/netfilter/
sudo apt-get install linux-modules-$(uname -r)
sudo modprobe nf_conntrack
lsmod | grep nf_conntrack
dmesg | grep nf_conntrack
sudo dmesg | grep nf_conntrack
modinfo nf_conntrack
sudo modprobe nf_conntrack
lsmod | grep nf_conntrack
grep CONFIG_NF_CONNTRACK /boot/config-$(uname -r)
sudo modprobe nf_conntrack
lsmod | grep nf_conntrack
modinfo nf_conntrack
sudo iptables -A PREROUTING -t nat -i ens4 -p tcp --dport 80 -j REDIRECT --to-port 5000
sudo vi /etc/iptables-rules.sh
sudo chmod +x /etc/iptables-rules.sh
sudo vi /etc/rc.local
sudo vi /etc/systemd/system/iptables-rules.service
sudo systemctl enable iptables-rules.service
sudo reboot
cd templates/
ls
cp index.html index.html.orig
vi index.html
clear
more index.html
ls
rm index.html
vi index.html
rm index.html
vi index.html
rm index.html
vi index.html
sudo reboot
pwd
cd templates/
ls
cp index.html_with_disclaimer
vi index.html
cd ..
python3 app.py 
ps af |grep app
ps af 
ps -af
sudo ps -af
service --status-all |grep app
service --status-all 
sudo service --status-all 
ls /etc/sysctl.d/
ls /etc/systemd/
ls /etc/services 
more /etc/services 
sudo systemctl list-unit-files --type=service
sudo systemctl restart lab.service
pwd
cd templates/
vi index.html
sudo systemctl restart lab.service
sudo systemctl status lab.service
sudo systemctl stop lab.service
sudo systemctl start lab.service
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
vi index.html
sudo systemctl stop lab.service
vi index.html
sudo systemctl start lab.service
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
ls
cp index.html index.html.with.disclamer
cd ..
ls
more url_constract.py
vi url_constract.py
ls
vi app
vi app.
vi app.py
cd templates/
vi index.html
cd ..
vi app.py
vi url_constract.py
cp url_constract.py url_constract.py.orig 
cp app.py app.py.orig 
cp start_container.py start_container.py.orig 
docker image ls
pip install docker
pwd
vi count_images.py
python3 count_images.py 
docker ps
python3 count_images.py 
vi count_images.py
python3 count_images.py 
vi count_images.py
python3 count_images.py 
docker images
ls
rm count_images.py 
vi count_images.py
python3 count_images.py 
docker ps
vi count_images.py 
more app.py
ls
vi app.py
more app.py
ls
rm app.py
vi app.py
cd templates/
vi index.html
more index.html
cp index.html index.html.orig
rm index.html
vi index.html
cd ..
sudo systemctl stop lab.service
sudo systemctl start lab.service
python3 count_images.py 
docker ps
python3 count_images.py 
sudo reboot
ls
cd templates/
ls
cp index.html index.html.nomoreavail
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
vi index.html
date
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
vi index.html
sudo systemctl stop lab.service
sudo systemctl start lab.service
cd ..
vi app.py
sudo systemctl stop lab.service
sudo systemctl start lab.service
timedatectl
uptime
sudo /etc/crontab
sudo vi /etc/crontab
sudo /etc/init.d/cron restart
pwd
more app.py
git --version
git config --global user.name "Yury Ostrovsky"
git config --global user.email "yostrovs@extremenetworks.com"
git config --list
ls
cp app.py app.py.orig 
cp count_images.py count_images.py.orig
cp start_container.py start_container.py.orig
cp url_constract.py url_constract.py.orig 
cd templates/
ls
cp index.html index.html.orig 
rm index.html.nomoreavail 
rm index.html.with.disclamer 
ls
cd ..
ls
cd static/
ls
cd ..
git init
git add .
git commit -m "Initial Commit" -a
git remote add origin ssh://git@github.com:YuryOstrovsky/ExtremeApiLabs.git
git remote -v
git push origin main
git remote add origin https://github.com/YuryOstrovsky/ExtremeApiLabs.git
git remote delete origin ssh://git@github.com:YuryOstrovsky/ExtremeApiLabs.git
git remote remove origin ssh://git@github.com:YuryOstrovsky/ExtremeApiLabs.git
git remote -v
ssh-keygen -t rsa -b 4096 -C "yostrovs@extremenetworks.com"
cd /home/jupyter/.ssh/
ls
ls -ltr
more git_rsa.pub 
cd ..
pwd
cd ~
git push origin main
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/git_rsa
git push origin main
git commit -m "initial commit"
git push origin main
exit
git push origin main
git branch
pwd
git checkout -b main
git push -u origin main
git remote -v
git remote set-url origin git@github.com:YuryOstrovsky/ExtremeApiLabs.git
git push -u origin main
cd .ssh
ls
ls -al
more id_rsa.pub 
cd ..
ls
pwd
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git push -u origin main
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git pull -u origin main
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git pull  origin main
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git config pull.rebase false  origin main
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git config pull.rebase false  
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git pull  origin main
ls
ls /home
sudo mkdir /user01/backup
sudo mkdir /home/user01/backup
ls
sudo cp app.py /home/user01/backup/
sudo ls /home/user01/backup
sudo cp count_images.py /home/user01/backup/
sudo cp start_container.py /home/user01/backup/
sudo cp url_constract.py /home/user01/backup/
sudo mkdir /home/user01/backup/templates
cd templates/
cp index.html /home/user01/backup/templates/
sudo cp index.html /home/user01/backup/templates/
cd ..
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git pull  origin main --allow-unrelated-histories
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git commit -m "Merge remote-tracking branch 'origin/main'"
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git push origin main
ls
cd static/
ls
cd ..
ls
more README.md 
GIT_SSH_COMMAND="ssh -i ~/.ssh/git_rsa" git pull origin main
more README.md 
ls ./ssh
pwd
ls .ssh/
git config --global core.sshCommand "ssh -i ~/.ssh/git_rsa"
git pull origin main
pwd
ls -al
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/git_rsa
vi .bashrc 
exit
ssh-agent
ssh-add -l
ls -al .ssh
chmod 600 ./ssh/git_rsa
chmod 600 .ssh/git_rsa
ls -al
ls -al .ssh/
ls -al
chmod 700 .ssh
ls -al
exit
