#!/bin/bash -e

# Specify version
app=TEE-CLC
ver=14.114.0
package_base=${app}-${ver}
package=${package_base}.zip

# Download deb packages
wget -N https://github.com/Microsoft/team-explorer-everywhere/releases/download/v${ver}/${package}

# Install packages
sudo rm -Rf /opt/$app
sudo unzip -o -u $package -d /opt
sudo mv /opt/$package_base /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
