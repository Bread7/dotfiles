#!/bin/bash

git clone https://github.com/emersion/mako
cd mako
meson build
ninja -C build
sudo cp build/mako /usr/local/bin/
cd ..
sudo rm -r mako
