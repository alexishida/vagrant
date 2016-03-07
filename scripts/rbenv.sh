#!/bin/sh -e
echo '-- Provisionando -> ruby.sh --'

RUBY_VERSION=2.3.0

sudo apt-get -y install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev

cd /usr/local
git clone http://github.com/sstephenson/rbenv.git rbenv
chgrp -R staff rbenv
chmod -R g+rwxXs rbenv

echo 'export RBENV_ROOT=/usr/local/rbenv' >> /home/vagrant/.bash_profile
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /home/vagrant/.bash_profile
echo 'eval "$(rbenv init -)"' >> /home/vagrant/.bash_profile


echo 'export RBENV_ROOT=/usr/local/rbenv' >> /root/.bashrc
echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /root/.bashrc
echo 'eval "$(rbenv init -)"' >> /root/.bashrc

export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"

#git clone git://github.com/sstephenson/rbenv.git .rbenv
#echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
#echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone https://github.com/sstephenson/ruby-build.git /root/.rbenv/plugins/ruby-build
git clone https://github.com/sstephenson/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /root/.bash_profile
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> /home/vagrant/.bash_profile

export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

rbenv install -v "$RUBY_VERSION"
rbenv global "$RUBY_VERSION"

gem install bundler
gem install rails
rbenv rehash

sudo chown -R vagrant:vagrant /home/vagrant/.bash_profile
sudo chown -R vagrant:vagrant /home/vagrant/.rbenv
sudo chown -R vagrant:vagrant /usr/local/rbenv
