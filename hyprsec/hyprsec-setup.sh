#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

FOLDER_PATH=$(basename $(pwd))
if [[ "hyprsec" != $FOLDER_PATH ]]; then
    echo "[*] NOTE: Only run this from the root dir of dotfiles/hyprsec/ as this makes use of relative pathings."
    exit 1
fi

# # APT
# $scripts/install-parrot-packages.sh
# # sudo $scripts/apt-modification.sh
sudo apt install -y $(cat debsec-packages.txt)

scripts="./parrot-scripts"

# Environment
$scripts/environment.sh

# Post Stow modifications
$scripts/post-stow.sh

# Terminal
$scripts/install-terminals.sh

# Window Managers
## Hyprland
$scripts/install-hyprland.sh
## Swayfx
$scripts/install-swayfx.sh

# # ASDF
$scripts/install-asdf.sh
# Call script from unix
# Should the unix script becomes more complicated, asdf and rustup should separate
ASDF_SCRIPT="$(pwd)/../unix/lang-setup.sh"
if [ ! -f $ASDF_SCRIPT ]; then
    echo "Unix's lang-setup script is missing!"
    exit
fi
sudo -u "$SUDO_USER" bash $ASDF_SCRIPT

# # VMware copy/paste issue on wayland
$scripts/install-clipnotify.sh
$scripts/install-clipsync.sh
#
# # Custom tools
$scripts/install-tools.sh

# Install Misc
## Nerdfonts
## Tofi
## Satty
## Swaylock-effects
## Calcure
## Swww
## Waypaper
## Git-lfs
## Yazi
## Ripgrep-all
$scripts/install-misc.sh
## Greetd + ReGreet
$scripts/install-login-manager.sh


# Other small commands
## Add bat themes
batcat cache --build

$scripts/install-grub-themes.sh
