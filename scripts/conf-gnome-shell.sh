#!/bin/bash -e

BASE_DIR="$HOME/.local/share/gnome-shell/extensions"
EXTENSIONS_URL="https://extensions.gnome.org/extension-data"

function install_extension {
    ext=$1

    wget -N $EXTENSIONS_URL/$ext.zip
    ext_uuid=$(unzip -c $ext metadata.json | grep uuid | cut -d \" -f4)
    mkdir -p $BASE_DIR/$ext_uuid
    unzip -q -o $ext.zip -d $BASE_DIR/$ext_uuid/
    gnome-extensions enable $ext_uuid || :
    rm $ext.zip
}

install_extension caffeinepatapon.info.v42.shell-extension
install_extension workspace-indicatorgnome-shell-extensions.gcampax.github.com.v52.shell-extension
install_extension sound-output-device-chooserkgshank.net.v43.shell-extension

# Touchpad behavior
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
# Config workspaces
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/images/screenshots"
gsettings set org.gnome.desktop.interface enable-animations false

# Reload gnome-shell
killall -3 gnome-shell
