#!/bin/bash -e

# Download deb packages
package=$(wget -nv --content-disposition https://appinv.us/aisetup_linux_deb 2>&1 | tee /dev/tty | cut -d\" -f2)

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package
