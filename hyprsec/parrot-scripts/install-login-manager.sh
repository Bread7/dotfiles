#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

setup_zig(){
    arch=aarch64
    version=0.15.1
    bin_path=zig-${arch}-linux-${version}.tar.xz
    folder_path=zig-${arch}-linux-${version}
    zig_url="https://ziglang.org/download/${version}/${bin_path}"
    echo -e "Installing zig with arch: ${arch} and version: ${version}"

    wget ${zig_url}
    tar -xf ${bin_path}
    cd ${folder_path}
    sudo cp -r lib /lib/zig
    sudo cp zig /usr/bin
    cd ..
    sudo rm -r ${folder_path}
    sudo rm zig*
}

setup_ly(){
    sudo apt install -y build-essential libpam0g-dev libxcb-xkb-dev xauth xserver-xorg brightnessctl
    git clone https://codeberg.org/fairyglade/ly.git
    cd ly
    zig build
    zig build installexe -Dinit_system=systemd
    sudo systemctl disable getty@tty1.service
    sudo systemctl disable getty@tty2.service
    sudo systemctl enable ly.service
    cd ..
    sudo rm -r ly
}

setup_greetd(){
    echo "[**] Installing Greetd"
    # git clone https://git.sr.ht/~kennylevinsen/greetd
    # cd greetd
    # sudo -u "$SUDO_USER" cargo build --release
    # sudo cp target/release/{greetd,agreety} /usr/local/bin/
    # sudo cp greetd.service /etc/systemd/system/greetd.service
    # mkdir -p /etc/greetd
    # sudo cp config.toml /etc/greetd/config.toml
    # # Create greeteruser
    # sudo useradd -M -G video greeter
    # sudo chmod -R go+r /etc/greetd/
    # systemctl enable --now greetd
    # cd ..
    # sudo rm -r greetd
    sudo apt update && sudo apt install -y greetd


    # echo "[**] Installing GTKGreet for Greetd"
    # git clone https://git.sr.ht/~kennylevinsen/gtkgreet
    # cd gtkgreet
    # meson build
    # ninja -C build
    # sudo cp build/gtkgreet/gtkgreek /usr/local/bin
    # cd ..
    # sudo rm -r gtkgreet
}

# https://bbs.archlinux.org/viewtopic.php?id=302883
# https://wiki.archlinux.org/title/Greetd
# https://www.reddit.com/r/NixOS/comments/14rhsnu/regreet_greeter_for_greetd_doesnt_show_a_session/
# https://www.reddit.com/r/pop_os/comments/1jxbixv/cannot_install_ecryptfsutils/
#
setup_greeters(){

    echo "[**] Setting up PAM for Greetd"
    if [[ -f /etc/pam.d/greetd ]]; then
        echo "greetd file exists in /etc/pam.d"
        echo "Will not modify the file"
    else
        if [[ -f /etc/pam.d/login ]]; then
            echo "Copying /etc/pam.d/login as greetd file in /etc/pam.d"
            sudo cp /etc/pam.d/login /etc/pam.d/greetd
        else
            echo "Login file in pam.d not found. Is PAM installed?"
            exit 1
        fi
    fi
    echo "Creating greetd environments/commands"
    echo "hyprland
sway
bash
fish" | sudo tee /etc/greetd/environments

    echo "Creating sway-greet configs"
    echo "exec \"gtkgreet -l; swaymsg exit\"
include /etc/sway/config.d/*" \
        | sudo tee /etc/greetd/sway-greet

    echo "[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# command = \"agreety --cmd /bin/sh\"
# command = \"sway --config ~/.config/sway/config\"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the $(video) group.
# command = \"sway --config /etc/greetd/sway-greet\"
command = \"Hyprland\"
user = \"$SUDO_USER\"

[initial_session]
command = \"Hyprland\"
user = \"$SUDO_USER\""\
    | sudo tee /etc/greetd/config.toml

#     echo "Creating GTKGreet css"
#     echo "window {
#    background-image: url(\"file:///usr/share/backgrounds/nature.jpg\");
#    background-size: cover;
#    background-position: center;
# }
#
# box#body {
#    background-color: rgba(60, 56, 54, 0.6);
#    border-radius: 10px;
#    padding: 50px;
#    color: white;
# }"\
#     | sudo tee /etc/greetd/greet.css

    echo "[**] Installing ReGreet to use with Greetd"
    git clone https://github.com/rharish101/ReGreet
    cd ReGreet
    # sudo -u "$SUDO_USER" cargo build --all-features --release
    cargo build --all-features --release
    sudo cp target/release/regreet /usr/local/bin
    sudo cp systemd-tmpfiles.conf /etc/tmpfiles.d/regreet.conf
    cd ..
    sudo rm -r ReGreet
}
echo "[*] Installing login managers"
# setup_zig
# setup_ly
setup_greetd
setup_greeters
