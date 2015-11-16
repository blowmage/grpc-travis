# Install grps
echo "deb http://http.debian.net/debian jessie-backports main" | sudo tee -a /etc/apt/sources.list
sudo apt-get update -y
sudo apt-get install libgrpc-dev -y --force-yes
