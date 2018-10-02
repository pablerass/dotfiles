#!/bin/bash -ex

repo_owner=openshift
repo_name=origin
repo_api_url=https://api.github.com/repos/$repo_owner/$repo_name/git

# Specify version
app=openshift
ver="v3.9.0"
commit=$(curl $repo_api_url/tags/$(curl $repo_api_url/refs/tags/$ver | jq -r ".object.sha") | jq -r ".object.sha")
package=openshift-origin-server-${ver}-${commit:0:7}-linux-64bit.tar.gz

# Download packages
wget -N https://github.com/$repo_owner/$repo_name/releases/download/$ver/$package

# Install packages
sudo tar -C /opt -xzf $package
sudo mv /opt/$(basename $package .tar.gz) /opt/$app

# Delete packages
rm -f $package

# Configure path
sudo sh -c "echo 'export PATH=\$PATH:/opt/$app' > /etc/profile.d/${app}.sh"
