#!/bin/bash -e

app=cypher-shell
ver=5.8.0
arch=all
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://dist.neo4j.org/$app/$package

# Install packages
sudo apt install openjdk-19-jre -y
sudo dpkg -i $package

# Delete packages
rm -f $package