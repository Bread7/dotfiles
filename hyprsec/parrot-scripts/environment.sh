#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

force_opengl(){
    # see: https://github.com/labwc/labwc/issues/1829
    # see: https://forum.portswigger.net/thread/missing-gui-elements-with-ubuntu-22-04-wayland-565abbae
    echo "[*] Force OpenGL acceleration (VM only)"
    echo "[*] This sets environment to occur on boot, before login"
    echo "[*] Setting LIBGL_ALWAYS_SOFTWARE=1 and XWAYLAND_NO_GLAMOR=1"

    echo "LIBGL_ALWAYS_SOFTWARE=1" | sudo tee -a /etc/environment
    echo "XWAYLAND_NO_GLAMOR=1" | sudo tee -a /etc/environment
    # For VM settings
    # https://github.com/hyprwm/Hyprland/issues/797
    echo "WLR_RENDERER_ALLOW_SOFTWARE=1" | sudo tee -a /etc/environment
    echo -e "\n"
}


parrot_gpg(){
    # https://parrotsec.org/blog/2025-01-11-parrot-gpg-keys/
    echo "[*] Installing gpg keys for parrot sources"
    sudo -u "$SUDO_USER" wget "https://deb.parrot.sh/parrot/pool/main/p/parrot-archive-keyring/parrot-archive-keyring_2024.12_all.deb"
    sudo apt install -y ./parrot-archive-keyring_2024.12_all.deb
    sudo apt update
    sudo rm parrot-archive-keyring_2024.12_all.deb
}

stow_configs(){
    echo "[*] Using stow to import configs to ~/.config"
    cd ..
    # Normally is $HOME but this script is running in sudo mode
    sudo -u $SUDO_USER stow --target=$SUDO_HOME unix/
    sudo -u $SUDO_USER stow --target=$SUDO_HOME hyprsec/
    cd hyprsec
}

additional_deps(){
    sudo apt update

    sudo apt install -y unzip vim stow hyprland

    # For hyprland
    sudo apt install -y librsvg2-dev libzip-dev libtomlplusplus-dev libjpeg-dev libwebp-dev \
        libjxl-dev libjxl-tools libjxl-devtools libmagic-dev libpng-dev libpugixml-dev \
        librust-wayland-client-dev wayland-protocols librust-wayland-protocols-dev \
        libsdbus-c++-dev libspa-0.2-dev libpipewire-0.3-dev libdrm-dev libgbm-dev \
        libseat-dev libinput-dev libudev-dev libdisplay-info-dev hwdata qt6-base-dev \
        libpolkit-agent-1-0 libpolkit-agent-1-dev libpolkit-qt6-1-1 libpolkit-qt6-1-dev \
        qt6-declarative-dev

    # For asdf's python plugin compilation
    sudo apt install -y libssl-dev zlib1g-dev \
    libbz2-dev libreadline-dev libsqlite3-dev \
    libncurses-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

    # For tofi
    sudo apt install -y meson scdoc wayland-protocols \
        libfreetype-dev libcairo2-dev libpango1.0-dev libwayland-dev libxkbcommon-dev libharfbuzz-dev

    # For swaylock-effects
    sudo apt install -y libpam-modules libpam-modules-bin libpam-runtime \
        libpam-systemd libpam0g librust-pam-dev \
        wayland-protocols libgdk-pixbuf-2.0-dev \
        cmake pkg-config

    # For satty
    sudo apt install -y libgtk-4-dev libadwaita-1-dev

    # For swww
    sudo apt install -y liblz4-dev

    # For calcure, waypaper
    sudo apt install -y pipx libgirepository-1.0-dev python3-gi-cairo gir1.2-gtk-4.0 python3-dev \
        python3-gi gir1.2-glib-2.0 libgirepository-2.0-dev

    # For yazi
    sudo apt install -y ffmpeg 7zip jq poppler-utils fd-find ripgrep fzf zoxide resvg wl-clipboard imagemagick

    # For ripgrep-all
    sudo apt install -y build-essential pandoc poppler-utils ffmpeg ripgrep

    # For asdf and crates
    sudo apt install -y rustup
    rustup default stable
}

essential_packages(){
    sudo apt update

    sudo apt install -y starship btrfs-assistant lazygit greetd gtkgreet bat
}

force_opengl
parrot_gpg
additional_deps
stow_configs
essential_packages
