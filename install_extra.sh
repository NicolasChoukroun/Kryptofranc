sudo apt update
sudo apt-get install hardinfo
sudo apt install software-center*
sudo apt-get isntall git-core
git.config --global.username "bitFranc"
git.config --global user.email "nicolas.choukroun@yandex.com"
snap install ubuntu-mate-welcome --classic
snap install software-boutique --classic
snap install pulsemixer
sudo apt install vsftpd
sudo cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
sudo ufw allow 20/tcp
sudo ufw allow 21/tcp
sudo ufw allow 990/tcp
sudo ufw allow 40000:50000/tcp
sudo ufw allow 80:tcp
sudo yfw allow 443:tcp
sudo adduser nikko
sudo mkdir /home/nikko/ftp
sudo mkdir /home/nikko/http
sudo chown nobody:nogroup /home/nikko/ftp
sudo chown nobody:nogroup /home/nikko/http
sudo chmod +rw /home/nikko/ftp
sudo chmod +rw /home/nikko/http
# sudo openssl req -x509 -nodes -days 3650 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
cp assets_installer/vsftpd.conf /etc/vsftpd.conf
cp assets_installer/vsftpd.pem /etc/ssl/private/vsftpd.pem
systemctl restart vsftpd




