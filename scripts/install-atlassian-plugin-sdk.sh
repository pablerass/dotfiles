#!/bin/bash -e

KEYRING=/etc/apt/keyrings/atlassian-sdk.key

# Add repositories
sudo gpg --homedir /tmp --no-default-keyring --keyring $KEYRING \
    --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys B07804338C015B73
echo "deb [signed-by=$KEYRING] https://sdkrepo.atlassian.com/debian/ stable contrib" | \
   sudo tee /etc/apt/sources.list.d/atlassian-sdk.list

# Update repos and packages
sudo apt update -y

# Install packages
sudo apt install atlassian-plugin-sdk -y
