#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

setup_wezterm(){
    curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
    echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
    sudo apt update && sudo apt install -y wezterm
}

setup_ghostty(){
    curl -fsSL https://download.opensuse.org/repositories/home:clayrisser:sid/Debian_Unstable/Release.key | gpg --dearmor | sudo tee /etc/apt/keyrings/home_clayrisser_sid.gpg > /dev/null
    ARCH="$(dpkg --print-architecture)"
    sudo cat <<EOF > /etc/apt/sources.list.d/home:clayrisser:sid.sources
Types: deb
URIs: http://download.opensuse.org/repositories/home:/clayrisser:/sid/Debian_Unstable/
Suites: /
Architectures: $ARCH
Signed-By: /etc/apt/keyrings/home_clayrisser_sid.gpg
EOF
    sudo apt update
    sudo apt install -y ghostty
}

echo "[*] Installing wezterm and ghostty terminals"
setup_wezterm
setup_ghostty
