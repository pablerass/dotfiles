#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME
KEYRING=/etc/apt/keyrings/postgresql.asc

# Add repositories
curl -fsSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo gpg --dearmor -o $KEYRING
echo "deb [signed-by=$KEYRING] http://apt.postgresql.org/pub/repos/apt $DISTRO-pgdg main" | \
   sudo tee /etc/apt/sources.list.d/postgres.list


# Update repos
sudo apt update -y

# Install packages
sudo apt install -y postgresql-client
