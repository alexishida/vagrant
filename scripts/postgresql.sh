#!/bin/sh -e
echo '-- Provisionando -> postgresql.sh --'


sudo touch /etc/apt/sources.list.d/postgresql.list
echo 'deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main' | sudo tee --append /etc/apt/sources.list.d/postgresql.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update

PG_VERSION=9.4

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_HBA_BKP="/etc/postgresql/$PG_VERSION/main/pg_hba_bkp.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

sudo apt-get -y install "postgresql-$PG_VERSION" "postgresql-contrib-$PG_VERSION" "postgresql-server-dev-$PG_VERSION"

sudo -u postgres createuser --superuser vagrant
sudo -u postgres createdb -O vagrant activerecord_unittest
sudo -u postgres createdb -O vagrant activerecord_unittest2

# Criando uma copia do pg_hba_conf
sudo cp "$PG_HBA" "$PG_HBA_BKP"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Config permissões do postgres
echo "local   all             all                                     trust" > "$PG_HBA"
echo "host    all             all             127.0.0.1/32            trust" >> "$PG_HBA"
echo "host    all             all             ::1/128                 trust" >> "$PG_HBA"
echo "host    all             all             all                 trust" >> "$PG_HBA"

# Explicitly set default client_encoding
echo "client_encoding = utf8" >> "$PG_CONF"

sudo service postgresql restart
