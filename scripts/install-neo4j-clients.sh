#!/bin/bash -e

app=cypher-shell
ver=2026.10.1
arch=all
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://dist.neo4j.org/$app/$package

# Install packages
sudo apt install openjdk-21-jre -y
sudo dpkg -i $package

# Delete packages
rm -f $package

# Manual?
#sdk install java 19.0.2-open /usr/lib/jvm/java-19-openjdk-amd64