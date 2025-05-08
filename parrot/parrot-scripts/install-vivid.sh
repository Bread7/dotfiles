#!/bin/bash

echo "Installing vivid from github v0.10.1 25/11/24"

file=vivid_0.10.1_arm64.deb
wget "https://github.com/sharkdp/vivid/releases/download/v0.10.1/$file"
sudo dpkg -i $file
rm $file
