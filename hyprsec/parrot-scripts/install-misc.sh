#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

current_dir=$(pwd)
ARCH="$(dpkg --print-architecture)"

# Clear /tmp
sudo rm -rf /tmp/*
sudo rm -rf /tmp/.*

setup_nerdfonts(){
    echo "[**] Installing nerdfonts"

    nerdfonts_version=v3.4.0
    fonts_path=$SUDO_HOME/.local/share/fonts
    url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/"

    font="FantasqueSansMono.zip"
    echo "[***] Installing nerdfonts: $font"
    wget -P $fonts_path $url$font \
        && cd $fonts_path \
        && yes | unzip $font \
        && rm $font

    font="JetBrainsMono.zip"
    echo "[***] Installing nerdfonts: $font"
    wget -P $fonts_path $url$font \
        && cd $fonts_path \
        && yes | unzip $font \
        && rm $font

    font="Iosevka.zip"
    echo "[***] Installing nerdfonts: $font"
    wget -P $fonts_path $url$font \
        && cd $fonts_path \
        && yes | unzip $font \
        && rm $font

    cd $fonts_path && fc-cache -fv
    cd $current_dir
}

setup_tofi(){
    echo "[**] Installing tofi from github"

    git clone https://github.com/philj56/tofi.git
    cd tofi
    meson build && ninja -C build install
    cd ..
    sudo rm -r tofi
}

setup_swaylock_effects(){
    echo "[**] Installing swaylock-effects from github"

    git clone https://github.com/mortie/swaylock-effects.git
    cd swaylock-effects
    meson build
    ninja -C build
    sudo ninja -C build install
    cd ..
    sudo rm -r swaylock-effects

    # May need suid swaylock binary if PAM does not exists
    # sudo chmod a+s /usr/local/bin/swaylock
}

setup_satty(){
    echo "[**] Installing satty from github"

    git clone https://github.com/gabm/Satty.git
    cd Satty
    make build-release
    sudo PREFIX=/usr/local make install
    cd ..
    sudo rm -r Satty
}

# Not in use
setup_calcure(){
    pipx install calcure
}

setup_swww(){
    echo "[**] Installing swww from github"

    git clone https://github.com/LGFae/swww.git
    cd swww
    cargo build --release
    sudo cp target/release/swww /usr/local/bin
    sudo cp target/release/swww-daemon /usr/local/bin
    cp completions/swww.fish $SUDO_HOME/.config/fish/completions/swww.fish
    ./doc/gen.sh
    cd ..
    sudo rm -r swww
}

setup_waypaper(){
    echo "[**] Installing waypaper (executed after installing swww)"
    sudo chown -R $SUDO_USER:$SUDO_USER $SUDO_HOME/.local
    sudo -u "$SUDO_USER" pipx install waypaper
}

setup_git_lfs(){
    echo "[**] Installing git lfs"
    # sudo os=debian dist=bookworm ./git-lfs-setup.sh
    sudo apt update && sudo apt install -y git-lfs
}

setup_yazi(){
    echo "[**] Installing yazi using crates"
    sudo -u "$SUDO_USER" cargo install --force --git https://github.com/sxyazi/yazi.git yazi-build
}

setup_ripgrep_all(){
    echo "[**] Installing ripgrep-all with cargo 25/11/24"

    sudo -u "$SUDO_USER" cargo install --locked ripgrep_all
    rga --version
}

setup_neovim(){
    echo "[**] Installing neovim from github"

    git clone https://github.com/neovim/neovim
    cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo

    # For other distro
    # sudo make install
    #
    # For debian / ubunutu
    cd build && sudo cpack -G DEB && sudo dpkg -i nvim-linux*.deb
    cd ../.. && sudo rm -r neovim
}

# setup_greetd(){
    # echo "[**] Installing Greetd"
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



    # echo "[**] Installing GTKGreet for Greetd"
    # git clone https://git.sr.ht/~kennylevinsen/gtkgreet
    # cd gtkgreet
    # meson build
    # ninja -C build
    # sudo cp build/gtkgreet/gtkgreek /usr/local/bin
    # cd ..
    # sudo rm -r gtkgreet
# }

# https://bbs.archlinux.org/viewtopic.php?id=302883
# https://wiki.archlinux.org/title/Greetd
# https://www.reddit.com/r/NixOS/comments/14rhsnu/regreet_greeter_for_greetd_doesnt_show_a_session/
# https://www.reddit.com/r/pop_os/comments/1jxbixv/cannot_install_ecryptfsutils/
#
# setup_greeters(){
#
#     echo "[**] Setting up GTKGreet"
#     if [[ -f /etc/pam.d/greetd ]]; then
#         echo "greetd file exists in /etc/pam.d"
#         echo "Will not modify the file"
#     else
#         if [[ -f /etc/pam.d/login ]]; then
#             echo "Copying /etc/pam.d/login as greetd file in /etc/pam.d"
#             sudo cp /etc/pam.d/login /etc/pam.d/greetd
#         else
#             echo "Login file in pam.d not found. Is PAM installed?"
#             exit 1
#         fi
#     fi
#     echo "Creating greetd environments/commands"
#     echo "hyprland
#     sway
#     bash
#     fish" | sudo tee /etc/greetd/environments
#
#     echo "Creating sway-greet configs"
#     echo "exec \"gtkgreet -l; swaymsg exit\"
# include /etc/sway/config.d/*" \
#         | sudo tee /etc/greetd/sway-greet
#
#     echo "[terminal]
# # The VT to run the greeter on. Can be "next", "current" or a number
# # designating the VT.
# vt = 1
#
# # The default session, also known as the greeter.
# [default_session]
#
# # command = \"agreety --cmd /bin/sh\"
# # command = \"sway --config ~/.config/sway/config\"
#
# # The user to run the command as. The privileges this user must have depends
# # on the greeter. A graphical greeter may for example require the user to be
# # in the $(video) group.
# # command = \"sway --config /etc/greetd/sway-greet\"
# command = \"Hyprland\"
# user = \"$SUDO_USER\"
#
# [initial_session]
# command = \"Hyprland\"
# user = \"greeter\""\
#     | sudo tee /etc/greetd/config.toml
#
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
#
#     # echo "[**] Installing ReGreet to use with Greetd"
#     # git clone https://github.com/rharish101/ReGreet
#     # cd ReGreet
#     # sudo -u "$SUDO_USER" cargo build --all-features --release
#     # sudo cp target/release/regreet /usr/local/bin
#     # sudo cp systemd-tmpfiles.conf /etc/tmpfiles.d/regreet.conf
#     # cd ..
#     # sudo rm -r ReGreet
#
# }

setup_bottom(){
    echo "[**] Installing bottom"

    btm_version=0.11.1
    curl -LO "https://github.com/ClementTsang/bottom/releases/download/$btm_version/bottom_$btm_version-1_$ARCH.deb"
    sudo dpkg -i "bottom_$btm_version-1_$ARCH.deb"
    sudo rm "bottom_$btm_version-1_$ARCH.deb"
}

setup_vivid(){
    echo "[**] Installing vivid from github v0.10.1 25/11/24"

    file=vivid_0.10.1_arm64.deb
    wget "https://github.com/sharkdp/vivid/releases/download/v0.10.1/$file"
    sudo dpkg -i $file
    rm $file
}

echo "[*] Setting up misc tools and utils"
setup_nerdfonts
setup_tofi
setup_swaylock_effects
setup_satty
setup_swww
setup_waypaper
setup_git_lfs
setup_yazi
setup_ripgrep_all
setup_neovim
setup_vivid
setup_bottom
