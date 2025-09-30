#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

setup_sway_deps(){
    # This requires wl-roots
    # wl-roots deps
    sudo apt install -y meson wayland-protocols libgles2 libegl-dev libdrm-common \
        libdrm-dev libgbm-dev libinput-dev libinput-bin librust-xkbcommon-dev udev \
        libpixman-1-0 librust-pixman-dev libseat-dev hwdata libdisplay-info-bin libdisplay-info-dev \
        libliftoff-dev libliftoff0

    # Install requirements for swayfx
    sudo apt install -y libpcre2-dev libjson-c-dev libcogl-pango-dev guile-cairo-dev \
        libgdk-pixbuf2.0-0 libgdk-pixbuf2.0-dev scdoc

    # Build latest xkbcommon for swayfx
    sudo apt install -y bison
    git clone https://github.com/xkbcommon/libxkbcommon
    cd libxkbcommon
    meson setup build \
      -Denable-x11=false \
      -Dxkb-config-root=/usr/share/X11/xkb \
      -Dx-locale-root=/usr/share/X11/locale
    meson compile -C build
    meson test -C build
    sudo ninja install -C build
    cd ..
    sudo rm -r libxkbcommon

}

setup_swayfx(){
    # Create new dir
    mkdir sway_bundle
    cd sway_bundle
    
    # Create subprojects dir for meson
    mkdir subprojects
    cd subprojects

    git clone https://gitlab.freedesktop.org/wlroots/wlroots --branch 0.19
    cd wlroots
    meson setup build/
    sudo ninja -C build/
    sudo ninja -C build/ install
    cd ..
    # sudo rm -r wlroots

    # scenefx
    git clone https://github.com/wlrfx/scenefx --branch 0.4.1
    cd scenefx
    meson setup build/
    sudo ninja -C build/
    sudo ninja -C build/ install
    cd ..

    cd ..
    # sudo rm -r scenefx
    git clone https://github.com/WillPower3309/swayfx
    mv subprojects swayfx
    cd swayfx
    meson setup build/
    sudo ninja -C build/
    sudo ninja -C build/ install
    cd ..
    # sudo rm -r swayfx
    
    # Exit bundle dir
    cd ..
    sudo rm -r sway_bundle

    # Copy .so lib files into /lib
    sudo cp /usr/local/lib/aarch64-linux-gnu/libscenefx-* /lib
    sudo cp /usr/local/lib/aarch64-linux-gnu/libwlroots-* /lib
}

setup_sway_deps
setup_swayfx
