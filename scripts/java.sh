#!/bin/sh -e
echo '-- Provisionando -> java.sh --'

# Removendo o openjdk
sudo apt-get remove --purge openjdk-*

# Adicionando repositorio JAVA
sudo apt-get install -y python-software-properties
sudo add-apt-repository ppa:webupd8team/java
sudo apt-get update

# Instalando java 8
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 select true | sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true | sudo debconf-set-selections
sudo apt-get install -y oracle-java8-installer oracle-java8-set-default