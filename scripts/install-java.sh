#!/bin/bash -e

# Add repositories
sudo add-apt-repository ppa:webupd8team/java -y

# Update repos and packages
sudo apt-get update -y

# Install packages
echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
sudo apt-get -y install oracle-java7-installer oracle-java8-installer
