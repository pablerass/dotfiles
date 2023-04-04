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
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-locations false
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/images/screenshots"
gsettings set org.gnome.desktop.interface enable-animations false

# Config media shortcuts
# TODO: Configure this automatically
# Sound and media - Microphone up - Shift+Ctrl+Alt+K     # This does not exists
# Sound and media - Microphone mute/unmute - Shift+Ctrl+Alt+U
# Sound and media - Microphone down- Shift+Ctrl+Alt+J    # This does not exists
# Sound and media - Next track - Ctrl+Alt+L
# Sound and media - Play (or play/pause) - Ctrl+Alt+I
# Sound and media - Previous track - Ctrl+Alt+H
# Sound and media - Volume down - Ctrl+Alt+K
# Sound and media - Volume mute/unmute - Ctrl+Alt+U
# Sound and media - Volume up - Ctrl+Alt+J


# Reload gnome-shell
killall -3 gnome-shell
