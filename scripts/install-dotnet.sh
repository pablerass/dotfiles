#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME
KEYRING=/etc/apt/keyrings/dotnet.key

# Add repositories
sudo gpg --homedir /tmp --no-default-keyring --keyring $KEYRING \
    --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
echo "deb [arch=amd64 signed-by=$KEYRING] https://apt-mo.trafficmanager.net/repos/dotnet-release/ ${DISTRO} main" | \
   sudo tee /etc/apt/sources.list.d/dotnetdev.list

# Update repos and packages
sudo apt update -y

# Uninstall
sudo apt purge -y dotnet-host || true

# Install packages
sudo apt install -y apt-transport-https $package

