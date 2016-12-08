#!/bin/bash -e

# Specify version
app=code
ver=1.7.2-1479766213
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://az764295.vo.msecnd.net/stable/7ba55c5860b152d999dda59393ca3ebeb1b5c85f/${package}

# Install packages
sudo dpkg -i $package

# Delete packages
rm -f $package

# Install extensions
code --install-extension ms-vscode.csharp
code --install-extension ms-vscode.cpptools
code --install-extension lukehoban.Go
code --install-extension donjayamanne.python
code --install-extension vscodevim.vim
