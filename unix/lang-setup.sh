#!/bin/bash

UNIX_PATH=$(pwd)
FOLDER_PATH=$(basename $(pwd))

#####################################################################################################
# ASDF Configs
#####################################################################################################
# Rustup is recommended for rust versions so asdf will not manage rust.

if ! command -v asdf >/dev/null 2>&1; then
    echo "ASDF not installed yet. Please install beforee proceeding."
    exit 1
fi

# Dotnet
echo "Installing latest dotnet using ASDF"
asdf plugin add dotnet
asdf install dotnet latest
asdf set -u dotnet latest

# Python
echo "Installing latest python using ASDF"
asdf plugin add python https://github.com/asdf-community/asdf-python.git
asdf install python latest
asdf set -u python latest

# Node
echo "Installing latest node using ASDF"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf set -u nodejs latest

# Pnpm
echo "Installing latest pnpm using ASDF"
asdf plugin add pnpm
asdf install pnpm latest
asdf set -u pnpm latest

# Uv
echo "Installing latest uv using ASDF"
asdf plugin add uv
asdf install uv latest
asdf set -u uv latest

# Golang
echo "Installing latest go using ASDF"
asdf plugin add golang https://github.com/asdf-community/asdf-golang.git
asdf install golang latest
asdf set -u golang latest

#####################################################################################################
# Rustup configs
#####################################################################################################
if ! command -v rustup >/dev/null 2>&1; then
    echo "Rustup not installed yet. Please install before proceeding."
    exit 1
fi

echo "Installing latest rustup toolchains components"
rustup default stable
