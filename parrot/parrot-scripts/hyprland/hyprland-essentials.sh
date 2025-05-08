#!/bin/bash

echo "Installing hyprutils"
git clone https://github.com/hyprwm/hyprutils.git
cd hyprutils/
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
sudo cmake --install build
cd ..
sudo rm -r hyprutils

echo "Installing XDGesktop Portal for Hyperland"
git clone --recursive https://github.com/hyprwm/xdg-desktop-portal-hyprland
cd xdg-desktop-portal-hyprland/
cmake -DCMAKE_INSTALL_LIBEXECDIR=/usr/lib -DCMAKE_INSTALL_PREFIX=/usr -B build
cmake --build build
sudo cmake --install build
cd ..
sudo rm -r xdg-desktop-portal-hyprland

echo "Installing Hyprpolkitagent"
git clone https://github.com/hyprwm/hyprpolkitagent
cd hyprpolkitagent
cmake -B build
cmake --build build
sudo cp build/hyprpolkitagent /usr/local/bin/
sudo cp build/hyprpolkitagent.service /etc/systemd/user/
sudo systemctl daemon-reload
cd ..
sudo rm -r hyprpolkitagent
