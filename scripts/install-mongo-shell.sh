#!/bin/bash -e

source /etc/lsb-release

VERSION=4.0
DISTRO=$DISTRIB_CODENAME
KEYRING=/etc/apt/keyrings/mongodb.key

# Add repositories
sudo gpg --homedir /tmp --no-default-keyring --keyring $KEYRING \
    --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 9DA31620334BD75D9DCB49F368818C72E52529D4
echo "deb [signed-by=$KEYRING] http://repo.mongodb.org/apt/ubuntu $DISTRO/mongodb-org/$VERSION multiverse" | \
   sudo tee /etc/apt/sources.list.d/mongodb.list


# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install mongodb-org-shell -y
