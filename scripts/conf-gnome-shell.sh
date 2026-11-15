#!/bin/bash -e

EXTENSIONS_URL="https://extensions.gnome.org/extension-data"

function install_extension {
    ext=$1

    wget -N $EXTENSIONS_URL/$ext.zip
    ext_uuid=$(unzip -c $ext metadata.json | grep uuid | cut -d \" -f4)
    gnome-extensions install --force $ext.zip
    rm $ext.zip
}

install_extension espressocoadmunkee.github.com.v10.shell-extension

# Touchpad behavior
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
# Config workspaces
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-locations false
gsettings set org.gnome.desktop.interface enable-animations false
gsettings set org.gnome.shell.extensions.ding show-home false
gsettings set org.gnome.settings-daemon.peripherals.touchscreen orientation-lock true

# Config media shortcuts
# TUNE: Configure this automatically
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
xdg-screensaver lock
