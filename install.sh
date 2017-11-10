#!/bin/bash

sudo apt update
sudo apt-get update

sudo apt-get install dnsmasq hostapd

# -- Node
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash
command -v nvm

exec bash

nvm install node
nvm use node

sudo git clone https://github.com/Vochsel/GameHub-Server.git
cd GameHub-Server

npm install
npm update