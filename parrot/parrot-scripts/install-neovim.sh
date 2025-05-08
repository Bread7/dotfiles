#!/bin/bash

echo "Installing neovim from github"

git clone https://github.com/neovim/neovim
cd neovim && git checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo

# For other distro
# sudo make install
#
# For debian / ubunutu
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
cd ../.. && sudo rm -r neovim
