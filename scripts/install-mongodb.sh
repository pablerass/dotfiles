#!/bin/bash

# Add repositories
sudo sh -c "echo deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse > /etc/apt/sources.list.d/mongodb.list"
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7F0CEB10

# Update repos and packages
sudo apt-get update -y

# Install packages
sudo apt-get install mongodb-org -y
