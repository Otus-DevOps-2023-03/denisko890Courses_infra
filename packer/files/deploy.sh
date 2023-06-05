#!/bin/bash
wget -qO - https://www.mongodb.org/static/pgp/server-4.2.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.2 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.2.list
apt-get update
sleep 60
apt install -y ruby-full ruby-bundler build-essential git mongodb-org
systemctl start mongod
systemctl enable mongod
systemctl status mongod
sudo mkdir -m 777 /opt/monolith_reddit
cd /opt/monolith_reddit
git clone -b monolith https://github.com/express42/reddit.git
cd reddit && bundle install
