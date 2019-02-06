#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME

# Version
package=dotnet-sdk-2.1.200

# Add repositories
sudo sh -c "echo deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ ${DISTRO} main > /etc/apt/sources.list.d/dotnetdev.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893
#wget -q packages-microsoft-prod.deb https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
#sudo dpkg -i packages-microsoft-prod.deb

# Update repos and packages
sudo apt update -y

# Uninstall
sudo apt purge -y dotnet-host || true

# Install packages
sudo apt install -y apt-transport-https $package

