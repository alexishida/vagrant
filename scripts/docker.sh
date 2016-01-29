#!/bin/sh -e
echo '-- Provisionando -> docker.sh --'
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo touch /etc/apt/sources.list.d/docker.list
echo 'deb https://apt.dockerproject.org/repo ubuntu-vivid main' | sudo tee --append /etc/apt/sources.list.d/docker.list
sudo apt-get update
sudo apt-get install -y docker-engine
sudo usermod -aG docker vagrant
sudo service docker start
sudo systemctl enable docker

# Installing docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.5.2/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
