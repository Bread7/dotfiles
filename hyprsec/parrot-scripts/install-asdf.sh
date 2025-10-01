#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

# Compile and install local asdf binary
setup_asdf(){
    version="v0.18.0"
    sudo apt update && sudo apt install -y golang
    git clone https://github.com/asdf-vm/asdf.git --branch $version
    cd asdf && make
    sudo cp asdf /usr/local/bin
    cd ..
    sudo -u $SUDO_USER asdf completion fish > ~/.config/fish/completions/asdf.fish
    sudo rm -r asdf && sudo apt remove -y golang
    # mkdir -p $SUDO_HOME/.config/fish/completions
    # ln -s $SUDO_HOME/.asdf/completions/asdf.fish $SUDO_HOME/.config/fish/completions

    # Export for temp bash session
    export PATH="${ASDF_DATA_DIR:-$SUDO_HOME/.asdf}/shims:$PATH"
}

post_rust(){
    sudo apt update && sudo apt install -y rustup
    rustup default stable
}

echo "[*] Settting up asdf into /usr/local/bin"
setup_asdf
echo "[*] Settting up rustup for lang-setup.sh"
post_rust
