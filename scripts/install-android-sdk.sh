#!/bin/bash -e

# Get script folder
script=$(readlink -f $0)
script_path=`dirname $script`

# Specify Android SDK version
app=android-sdk
version=24.4.1
file=android-sdk_r${version}-linux.tgz

# Download Android SDK
wget -N https://dl.google.com/android/$file

# Install Android SDK
if [ -d /opt/$app ]; then
	sudo rm -Rf /opt/$app
fi
tar -zxvf $file
sudo mv android-sdk-linux /opt/$app
sudo chown root:root /opt/$app
rm $file

# Add Android SDK to PATH
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
