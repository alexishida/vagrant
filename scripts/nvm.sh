#!/bin/sh -e

sudo apt-get install -y build-essential libssl-dev

wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.31.2/install.sh | bash


sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm install v6.2.2'
sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm use v6.2.2'
sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm alias default v6.2.2'
sudo su vagrant -c '. ~vagrant/.nvm/nvm.sh;nvm use default'

echo 'export NVM_DIR="/home/vagrant/.nvm"' >> /home/vagrant/.bash_profile
echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm' >> /home/vagrant/.bash_profile
