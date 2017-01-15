#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME

# Version
package=dotnet-dev-1.0.0-preview4-004233

# Add repositories
sudo sh -c "echo deb [arch=amd64] https://apt-mo.trafficmanager.net/repos/dotnet-release/ ${DISTRO} main > /etc/apt/sources.list.d/dotnetdev.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 417A0893

# Update repos and packages
sudo apt-get update -y

# Uninstall
sudo apt-get purge -y dotnet-host || true

# Install packages
sudo apt-get install -y $package

