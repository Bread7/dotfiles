#!/bin/bash

echo "Installing grub-btrfs for snapper"
git clone https://github.com/Antynea/grub-btrfs.git
cd grub-btrfs
sudo make
sudo make install
sudo systemctl enable grub-btrfsd
sudo systemctl start grub-btrfsd
sudo update-grub
cd ..
sudo rm -r grub-btrfs
