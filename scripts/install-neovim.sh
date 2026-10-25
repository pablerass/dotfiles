#!/bin/bash -e

app=nvim
pkg=nvim-linux-x86_64.tar.gz
base=${pkg%.tar.gz}

wget -N https://github.com/neovim/neovim/releases/latest/download/$pkg

if [ -d "/opt/$app" ] ; then
    sudo rm -rf /opt/$app
fi
sudo tar -C /opt -xzf $pkg
sudo mv /opt/$base /opt/$app
rm -Rf $pkg

sudo sh -c "echo 'export PATH=\$PATH:/opt/$app/bin' > /etc/profile.d/${app}.sh"