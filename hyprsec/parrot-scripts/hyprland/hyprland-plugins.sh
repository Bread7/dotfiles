#!/bin/bash

echo "Installing hyprpicker"
git clone https://github.com/hyprwm/hyprpicker
cd hyprpicker
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target hyprpicker -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
sudo cmake --install build
cd ..
sudo rm -r hyprpicker

echo "Installing hypridle"
git clone https://github.com/hyprwm/hypridle
cd hypridle
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hypridle -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
sudo cmake --install build
systemctl --user enable --now hypridle.service
cd ..
sudo rm -r hypridle

echo "Installing hyprgraphics"
git clone https://github.com/hyprwm/hyprgraphics
cd hyprgraphics
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf NPROCESSORS_CONF)
sudo cmake --install build
cd ..
sudo rm -r hyprgraphics

echo "Installing hyprlock (require hyprgraphics)"
git clone https://github.com/hyprwm/hyprlock
cd hyprlock
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -S . -B ./build
cmake --build ./build --config Release --target hyprlock -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
sudo cmake --install build
cd ..
sudo rm -r hyprlock

echo "Installing hyprcursor"
git clone https://github.com/hyprwm/hyprcursor
cd hyprcursor
cmake --no-warn-unused-cli -DCMAKE_BUILD_TYPE:STRING=Release -DCMAKE_INSTALL_PREFIX:PATH=/usr -S . -B ./build
cmake --build ./build --config Release --target all -j$(nproc 2>/dev/null || getconf _NPROCESSORS_CONF)
sudo cmake --install build
cd ..
sudo rm -r hyprcursor

echo "Installing hyprcursor rose-pine theme"
git clone https://github.com/ndom91/rose-pine-hyprcursor
mv rose-pine-hyprcursor $HOME/.local/share/icons/rose-pine-hyprcursor
