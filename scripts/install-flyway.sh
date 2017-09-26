#!/bin/bash -e

# Specify version
app=flyway
ver=4.2.0
package=${app}-commandline-${ver}-linux-x64.tar.gz
base_url=https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline

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
