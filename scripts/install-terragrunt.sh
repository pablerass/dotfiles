#!/bin/bash -e

# Specify version
arch=amd64

grunt_app=terragrunt
grunt_ver=0.17.0
grunt_package=${grunt_app}_linux_${arch}

form_app=terraform
form_ver=0.11.11
form_package=${form_app}_${form_ver}_linux_${arch}.zip

# Download packages
wget -N https://github.com/gruntwork-io/${grunt_app}/releases/download/v${grunt_ver}/${grunt_package}
wget -N https://releases.hashicorp.com/${form_app}/${form_ver}/${form_package}

# Install packages
sudo mkdir -p /opt/$grunt_app
chmod a+x $grunt_package
sudo mv $grunt_package /opt/$grunt_app/$grunt_app

sudo mkdir -p /opt/$grunt_app/$form_app
sudo unzip -o -u $form_package -d /opt/$grunt_app/$form_app
rm -f $form_package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$grunt_app\nexport TERRAGRUNT_TFPATH=/opt/$grunt_app/$form_app/$form_app' > /etc/profile.d/${grunt_app}.sh"
