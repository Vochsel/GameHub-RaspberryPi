#!/bin/bash

sudo apt update
sudo apt-get update

sudo apt-get -y install dnsmasq hostapd

# -- Node
#curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
wget -qO- https://raw.githubusercontent.com/xtuple/nvm/master/install.sh | sudo bash
command -v nvm

#exec bash

sudo nvm install v6.11.5
sudo nvm use v6.11.5

if [ ! -d "GameHub-Server" ]; then
    sudo git clone https://github.com/Vochsel/GameHub-Server.git
fi

cd GameHub-Server

sudo git pull

if [ ! -d "node_modules" ]; then
    sudo npm install
else
    sudo npm update
fi
