#!/bin/bash

echo "Installing tofi from github"
git clone https://github.com/philj56/tofi.git
cd tofi
meson build && ninja -C build install
cd ..
sudo rm -r tofi
