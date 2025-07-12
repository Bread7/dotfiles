#!/bin/bash

user_dir=$(pwd)
work_path=$(realpath ~/.config/zellij)
plugin_path=$work_path"/plugins"

if [[ $user_dir != $work_path ]]; then
    echo "Only run this script from ~/.config/zellij directory"
    exit 1
fi

if [[ -z $1 ]]; then
    echo "Argument missing for sudo password"
    echo "Example: ./install-plugins.sh <sudo password>"
    exit 1
fi

# Delete all contents
echo $1 | Sudo -S rm -r $plugin_path
mkdir -p $plugin_path
cd $plugin_path

# Install plugins
plugin_installer() {
    if [[ -z $2 ]]; then
        echo "Arg cannot be empty"
        exit 1
    fi
    cd $2 &&
        cargo build --release &&
        cd target/wasm32-wasip1/release &&
        cp *.wasm $plugin_path &&
        cd $plugin_path &&
        echo $1 | Sudo -S rm -r $2
}

plugin_installer_sed() {
    if [[ -z $2 ]]; then
        echo "Arg cannot be empty"
        exit 1
    fi
    cd $2 &&
        sed -i -e 's/wasm32-wasi/wasm32-wasip1/g' .cargo/config.toml &&
        cargo build --release &&
        cd target/wasm32-wasip1/release &&
        cp *.wasm $plugin_path &&
        cd $plugin_path &&
        echo $1 | Sudo -S rm -r $2
}

## Room
git clone https://github.com/rvcas/room.git
plugin_installer $1 "room"

## Forgot
git clone https://github.com/karimould/zellij-forgot.git
plugin_installer_sed $1 "zellij-forgot"

## Workspace
git clone https://github.com/vdbulcke/zellij-workspace.git
plugin_installer $1 "zellij-workspace"

## Statusbar
git clone https://github.com/dj95/zjstatus.git
plugin_installer $1 "zjstatus"

## Status-Hints
### Cannot compile due to toolchain errors
### download wasm file with specific version only
wget https://github.com/b0o/zjstatus-hints/releases/download/v0.1.4/zjstatus-hints.wasm

# Move back to zellij dir
cd ..
