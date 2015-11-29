#!/bin/sh -e
echo '-- Provisionando -> inicial.sh --'

# Atualizando localidade
sudo locale-gen pt_BR
sudo locale-gen pt_BR.UTF-8
sudo dpkg-reconfigure locales
sudo update-locale LANG=pt_BR.UTF-8

# Atualizando fuso-horário Porto Velho
 sudo timedatectl set-timezone America/Porto_Velho

# Atualizando apt-get
sudo apt-get -y autoremove
sudo apt-get -y update

