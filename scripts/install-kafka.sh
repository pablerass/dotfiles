#!/bin/bash -e

# Specify version
app=kafka
ver=2.1.0
package=${app}_2.11-${ver}.tgz

# Download package
wget -N http://apache.rediris.es/${app}/${ver}/${package}

# Install packages
sudo rm -Rf /opt/$app
sudo tar -xzf $package
sudo mv ${package%.*} /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' >> /etc/profile.d/${app}.sh"
