#!/bin/bash -x

# Install packages
sudo apt-get install libpcsclite1 pcscd pcsc-tools coolkey

# Configure firefox
echo "Add /usr/lib/pkcs11/libcoolkeypk11.so module to authentication"