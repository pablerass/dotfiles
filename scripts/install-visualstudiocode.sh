#!/bin/bash -e

# Specify version
app=code
ver=1.12.2-1494422229
arch=amd64
package=${app}_${ver}_${arch}.deb

# Download deb packages
wget -N https://az764295.vo.msecnd.net/stable/19222cdc84ce72202478ba1cec5cb557b71163de/${package}

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
