#!/bin/bash -e

BASE_DIR="$HOME/.local/share/gnome-shell/extensions"
EXTENSIONS_URL="https://extensions.gnome.org/extension-data"
EXTENSIONS="caffeine@patapon.info.v30.shell-extension_ov9BwbU.zip workspace-indicator@gnome-shell-extensions.gcampax.github.com.v36.shell-extension.zip sound-output-device-chooser@kgshank.net.v17.shell-extension.zip"

# Install extensions
for ext in ${EXTENSIONS[@]}; do
	wget -N $EXTENSIONS_URL/$ext
	ext_uuid=$(unzip -c $ext metadata.json | grep uuid | cut -d \" -f4)
	mkdir -p $BASE_DIR/$ext_uuid
	unzip -q -o $ext -d $BASE_DIR/$ext_uuid/
	gnome-shell-extension-tool -e $ext_uuid || :
	rm $ext
done

# Touchpad behavior
gsettings set org.gnome.desktop.peripherals.touchpad click-method areas
# Config workspaces
gsettings set org.gnome.mutter workspaces-only-on-primary false
gsettings set org.gnome.mutter dynamic-workspaces false
gsettings set org.gnome.shell.app-switcher current-workspace-only true
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.shell.extensions.dash-to-dock isolate-workspaces true
gsettings set org.gnome.gnome-screenshot auto-save-directory "file:///home/$USER/images/screenshots"

# Reload gnome-shell
killall -3 gnome-shell
