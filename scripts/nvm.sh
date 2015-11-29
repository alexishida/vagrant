#!/bin/sh -e

sudo apt-get install -y build-essential libssl-dev

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash


sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm install v5.1.0'
sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm use v5.1.0'
sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm alias default v5.1.0'
sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm use default'

echo 'export NVM_DIR="/home/vagrant/.nvm"' >> /home/vagrant/.bash_profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> /home/vagrant/.bash_profile