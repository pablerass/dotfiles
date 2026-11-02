#!/bin/bash -e

# Specify version
app=flyway
ver=13.12.0
package=${app}-commandline-${ver}-linux-x64.tar.gz
base_url=https://download.red-gate.com/maven/release/com/redgate/flyway/flyway-commandline

# Download package
wget -N $base_url/$ver/$package

# Unzip package
sudo tar xzf $package -C /opt
sudo mv /opt/${app}-$ver /opt/$app
sudo chmod a+x /opt/flyway/flyway

# Remove temporal package
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' >> /etc/profile.d/${app}.sh"
