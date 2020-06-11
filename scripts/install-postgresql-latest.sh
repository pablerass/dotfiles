#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME

# Add repositories
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo sh -c "echo deb http://apt.postgresql.org/pub/repos/apt $DISTRO-pgdg main > /etc/apt/sources.list.d/postgres.list"


# Update repos
sudo apt update -y

# Install packages
sudo apt install -y postgresql-client
