#!/bin/bash

echo "Installing satty from github"
git clone https://github.com/gabm/Satty.git
cd Satty
make build-release
sudo PREFIX=/usr/local make install
cd ..
sudo rm -r Satty
