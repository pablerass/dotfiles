#!/bin/bash -e

DIR=$(cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd)

# Specify version
package=Webex.deb

# Download deb packages
wget -N https://binaries.webex.com/WebexDesktop-Ubuntu-Official-Package/$package

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
