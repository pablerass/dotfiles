#!/bin/bash -e

BASE_DIR="$HOME/.local/share/gnome-shell/extensions"
EXTENSIONS_URL="https://extensions.gnome.org/extension-data"
EXTENSIONS="caffeine@patapon.info.v30.shell-extension_ov9BwbU.zip"

for ext in ${EXTENSIONS[@]}; do
	wget -N $EXTENSIONS_URL/$ext
	ext_uuid=$(unzip -c $ext metadata.json | grep uuid | cut -d \" -f4)
	mkdir -p $BASE_DIR/$ext_uuid
	unzip -q -o $ext -d $BASE_DIR/$ext_uuid/
	gnome-shell-extension-tool -e $ext_uuid || :
	rm $ext
done
gsettings set org.gnome.mutter workspaces-only-on-primary false
killall -3 gnome-shell
