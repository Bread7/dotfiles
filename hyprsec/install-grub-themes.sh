#!/bin/bash

grub_themes_path=$HOME/Core/grub-themes

# Make
if [[ -d $grub_themes_path ]]; then
    echo "$grub_themes_path exists."
else
    echo "$grub_themes_path does not exists, creating it..."
    mkdir -p $grub_themes_path
fi
echo "[*] Setting grub themes"
cd $grub_themes_path

if [[ -d grub2-themes ]]; then
    echo "grub2-themes have been installed"
else
    git clone https://github.com/vinceliuice/grub2-themes
fi

sudo ./grub2-themes/install.sh -t tela -c 1152x864 -b
