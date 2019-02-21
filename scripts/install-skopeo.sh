#!/bin/bash -e

# Specify version
app=skopeo
ver=0.1.32
package=v${ver}.zip
package_dir=$app-$ver

# Download packages
wget -N https://github.com/containers/skopeo/archive/$package

# Extract package
unzip -o -u $package
rm -f $package

# Build package
pushd $package_dir
make binary
popd

# Copy binary
sudo mkdir -p /opt/$app
sudo mv $package_dir/skopeo /opt/$app
rm -Rf $package_dir

# Install dependencies
sudo apt install libostree-1-1

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
