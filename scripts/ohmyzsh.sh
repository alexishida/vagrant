#!/bin/sh -e
echo '-- Provisionando -> ohmyzsh.sh --'

sudo apt-get install -y zsh
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

sudo chsh -s /bin/zsh vagrant
zsh