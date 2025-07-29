#!/bin/bash

MACOS_PATH=$(pwd)
FOLDER_PATH=$(basename $(pwd))

#####################################################################################################
# Make sure this is executed in `macos/` folder
#####################################################################################################
if [[ "macos" != $FOLDER_PATH ]]; then
	echo "Make sure to run this in macos/ folder."
    exit 1
fi

#####################################################################################################
# Install rosetta
#####################################################################################################
softwareupdate --install-rosetta --agree-to-license

#####################################################################################################
# Install brew packages
#####################################################################################################
echo "Installing brew packages using brewfile in $path"
brew bundle install --file=$MACOS_PATH/Brewfile


#####################################################################################################
# Port over configs
#####################################################################################################
## Set dir to base repo
cd ..

stow --target=$HOME unix
stow --target=$HOME macos
stow --target=$HOME dotfiles-private

## Set dir to macos
cd $MACOS_PATH

#####################################################################################################
# Setup ASDF
#####################################################################################################
# Call script from unix
# Should the unix script becomes more complicated, asdf and rustup should separate
UNIX_SCRIPT="$(pwd)/../unix/lang-setup.sh"
if [ ! -f $UNIX_SCRIPT ]; then
    echo "Unix's lang-setup script is missing!"
    exit
fi
bash $UNIX_SCRIPT

#####################################################################################################
# Setup Zellij
#####################################################################################################
# Tentatively need do do it manually since require sudo rights
# cd $HOME/.config/zellij
# ./install-plugins.sh
# cd $MACOS_PATH
echo "Make sure to manually setup zellij plugins."

#####################################################################################################
# Install additional packages
#####################################################################################################

#####################################################################################################
# Configure MacOS defaults
#####################################################################################################
echo "Configuring MacOS Defaults"
./macos_settings

#####################################################################################################
# Make fish the default shell
#####################################################################################################
echo "Making fish the default shell"
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)

#####################################################################################################
# Uses displayplacer for builtin display config
#####################################################################################################
if ! command -v displayplacer; then
    echo "Displayplacer not found. Please install displayplacer first."
    exit 1
fi

DEGREE="0"
ORIGIN="(0,0)"
MODE=$(displayplacer list | grep 2560x1600 | grep hz:120 | head -1 | awk '{print $2}')
ID=$(displayplacer list | rg -B 5 built | rg "Persistent" | awk '{print $4}')
# Remove ":" from the string using ${MODE%?}

echo "Configuring MacOS screen with 2560x1600 120hz resolution"
displayplacer "id:$ID res:2560x1600 hz:120 color_depth:8 scaling:off origin:(0,0) degree:0"

#####################################################################################################
# Setting bat themes
#####################################################################################################
if ! command -v bat; then
    echo "Bat not found. Please install bat first."
    exit 1
fi

bat cache --build

#####################################################################################################
# Setting default browser
#####################################################################################################
echo "Setting firefox as default browser"
brew install defaultbrowser
defaultbrowser firefox
brew uninstall defaultbrowser

#####################################################################################################
# Uncertain brews
#####################################################################################################
cat <<EOF
Uncertain brew packages not installed yet:
brew install --cask slack
brew install --cask affinity-photo
brew install --cask affinity-publisher
brew install --cask affinity-designer
brew install --cask rawtherapee
brew install --cask utm
brew install --cask virtualbox

EOF

#####################################################################################################
# Non brew
#####################################################################################################
cat <<EOF
Below are some other non-brew packages:

Binary Ninja to follow link from email.

Unsplash to be installed from Mac App Store.
Moomoo to be installed from Mac App Store.
Brother IPrint&Scan to be installed from Mac App Store.
Kindle to be installed from Mac App Store.

PDF Studio 2022 download here: https://kbpdfstudio.qoppa.com/download-pdf-studio-version-2022/

VMWare Fusion requires login to Broadcom web before downloading.
DaVinci Resolve requires login to web before downloading.
EOF

echo "Make sure to restart terminal/shell for updated PATHS."

echo "\nUse set-wallpaper </\$path/to/wallpaper.jpg> to set wallpaper."

echo "After installing all the other applications, run duti.sh to set default applications"
