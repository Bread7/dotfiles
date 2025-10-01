#!/bin/bash

set -e

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

setup_hypr_deps(){
    echo "[***] Intalling hyprland-protocols"
    git clone https://github.com/hyprwm/hyprland-protocols
    cd hyprland-protocols
    meson setup build
    sudo meson install -C build
    cd ..
    sudo rm -r hyprland-protocols

    echo "[***] Intalling hyprwayland-scanner (builds)"
    git clone https://github.com/hyprwm/hyprwayland-scanner
    cd hyprwayland-scanner
    cmake -DCMAKE_INSTALL_PREFIX=/usr -B build
    cmake --build build -j `nproc`
    sudo cmake --install build
    cd ..
    sudo rm -r hyprwayland-scanner

    echo "[***] Intalling hyprutils"
    git clone https://github.com/hyprwm/hyprutils.git
    cd hyprutils/
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
    sudo cmake --install build
    cd ..
    sudo rm -r hyprutils

    echo "[***] Intalling aquamarine"
    git clone https://github.com/hyprwm/aquamarine.git
    cd aquamarine
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
    sudo cmake --install ./build
    cd ..
    sudo rm -r aquamarine

    echo "[***] Intalling hyprlang"
    git clone https://github.com/hyprwm/hyprlang.git
    cd hyprlang
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target hyprlang -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
    sudo cmake --install ./build
    cd ..
    sudo rm -r hyprlang

    echo "[***] Intalling hyprcursor"
    git clone https://github.com/hyprwm/hyprcursor.git
    cd hyprcursor/
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
    sudo cmake --install build
    cd ..
    sudo rm -r hyprcursor

    echo "[***] Intalling hyprgraphics"
    git clone https://github.com/hyprwm/hyprgraphics
    cd hyprgraphics/
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
    sudo cmake --install build
    cd ..
    sudo rm -r hyprgraphics

    echo "[***] Installing XDGesktop Portal for Hyperland"
    git clone --recursive https://github.com/hyprwm/xdg-desktop-portal-hyprland
    cd xdg-desktop-portal-hyprland/
    cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build
    cmake --build build
    sudo cmake --install build
    cd ..
    sudo rm -r xdg-desktop-portal-hyprland

    echo "[***] Installing Hyprpolkitagent"
    git clone https://github.com/hyprwm/hyprpolkitagent
    cd hyprpolkitagent
    cmake -B build
    cmake --build build
    sudo cp build/hyprpolkitagent /usr/local/bin/
    sudo cp build/hyprpolkitagent.service /etc/systemd/user/
    sudo systemctl daemon-reload
    cd ..
    sudo rm -r hyprpolkitagent
}

setup_hypr_plugins(){
    echo "[***] Installing hyprpicker"
    git clone https://github.com/hyprwm/hyprpicker
    cd hyprpicker
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target hyprpicker -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
    sudo cmake --install build
    cd ..
    sudo rm -r hyprpicker

    echo "[***] Installing hypridle"
    git clone https://github.com/hyprwm/hypridle
    cd hypridle
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
    sudo cmake --install build
    # systemctl --user enable --now hypridle.service
    cd ..
    sudo rm -r hypridle

    echo "[***] Installing hyprlock (require hyprgraphics)"
    git clone https://github.com/hyprwm/hyprlock
    cd hyprlock
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
    cmake --build ./build --config Release --target hyprlock -j`nproc 2>/dev/null || getconf _NPROCESSORS_CONF`
    sudo cmake --install build
    cd ..
    sudo rm -r hyprlock

    echo "[***] Installing hyprcursor rose-pine theme"
    git clone https://github.com/ndom91/rose-pine-hyprcursor
    mkdir -p $SUDO_HOME/.local/share/icons/rose-pine-hyprcursor
    sudo chown -R $SUDO_USER:$SUDO_USER $SUDO_HOME/.local
    mv rose-pine-hyprcursor $SUDO_HOME/.local/share/icons/rose-pine-hyprcursor
}

# Remove if not installing in VM
setup_vm_deps(){
    echo "[***] Installing KVM for hyprland"
    sudo apt update
    sudo apt install -y qemu-system libvirt-daemon-system mesa-utils mesa-common-dev
    adduser $SUDO_USER libvirt
    # virsh --connect qemu:///system list --all
    # export LIBVIRT_DEFAULT_URI='qemu:///system'
}

setup_hyprland(){
    sudo apt install -y libre2-dev libxcb-res0-dev libxcb-errors-dev libxcb-composite0-dev libxcb-icccm4-dev \
        libxcb-xfixes0-dev libudis86-dev libglaze-dev libxcb-util-dev libxcb-ewmh-dev libxcb-ewmh2
    git clone --recursive https://github.com/hyprwm/Hyprland --branch v0.51.0
    cd Hyprland
    #patch -p1 < ../fix-hyprland-compile.patch
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DNO_UWSM:STRING=true -B build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
    sudo cmake --install ./build
    cd ..
    sudo rm -r Hyprland
}

not_working(){
    echo "[***] Installing Hyprland Qt Support"
    sudo apt install -y qt6-base-dev qt6-wayland qt6-declarative-dev qml6-module-qtcore \
        qml6-module-qtquick-layouts qt6-tools-dev qt6-tools-dev-tools qt6-charts-dev
    git clone https://github.com/hyprwm/hyprland-qt-support
    cd hyprland-qt-support
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -DINSTALL_QML_PREFIX=/lib/qt6/qml -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
    cd ..
    sudo rm -r hyprland-qt-support

    echo "[***] Installing Hyprland Qtutils"
    sudo apt install -y qt6-base-dev qt6-wayland qt6-declarative-dev qml6-module-qtcore \
        qml6-module-qtquick-layouts qt6-tools-dev qt6-tools-dev-tools qt6-charts-dev
    git clone https://github.com/hyprwm/hyprland-qtutils
    cd hyprland-qtutils
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
    cd ..
    sudo rm -r hyprland-qtutils

    echo "[***] Installing Hyprland Qtutils"
    sudo apt install -y qt6-wayland qt6-wayland-dev qt6-wayland-dev-tools qt6-wayland-private-dev libkwaylandclient6 \
        	libqt6core5compat6 qt6-base-dev qt6-wayland-dev qt6-wayland qt6-declarative-dev qml6-module-qtcore \
            qt6-3d-dev qt6-5compat-dev libqt6waylandclient6 qml6-module-qtwayland-client-texturesharing
    git clone https://github.com/hyprwm/hyprland-qtutils
    cd hyprland-qtutils
    cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
    cmake --build ./build --config Release --target all -j`nproc 2>/dev/null || getconf NPROCESSORS_CONF`
    cd ..
    sudo rm -r hyprland-qtutils
}

echo "[*] Installing Hyprland as Window Manager"
echo "[**] Installing dependencies..."
#not_working
setup_hypr_deps
# setup_vm_deps # Remove if not installing in VM
echo "[**] Installing plugins..."
setup_hypr_plugins
echo "[**] Installing hyprland"
setup_hyprland
