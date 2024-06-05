#!/bin/bash -e

source /etc/lsb-release

DISTRO=$DISTRIB_CODENAME
KEYRING=/etc/apt/keyrings/mono-official-archive-keyring.gpg

# Add repositories
sudo gpg --homedir /tmp --no-default-keyring --keyring $KEYRING \
    --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
sudo sh -c "echo deb [signed-by=$KEYRING] https://download.mono-project.com/repo/ubuntu ${DISTRO} main > /etc/apt/sources.list.d/mono-xamarin.list"

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install -y mono-complete
