#!/bin/bash -e

# Specify version
app=groovy-sdk
ver=2.4.7
package=apache-${app}-${ver}.zip
base_url=https://dl.bintray.com/groovy/maven

# Download package
wget -N $base_url/$package

# Unzip package
sudo mkdir -p /opt/$app
sudo unzip -o -u $package -d /opt/$app

# Remove temporal package
rm -f $package

# Configure path
sudo sh -c "echo 'export GROOVY_HOME=/opt/$app/groovy-${ver}' > /etc/profile.d/${app}.sh"
sudo sh -c "echo 'export PATH=\$PATH:\$GROOVY_HOME/bin' >> /etc/profile.d/${app}.sh"
