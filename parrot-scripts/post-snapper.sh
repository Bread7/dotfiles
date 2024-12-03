#!/bin/bash

echo "Modifying /etc/apt/apt.conf.d/80snapper to use custom snapper scripts"
user_home=$HOME
aptdir=/etc/apt
sudo mkdir -p $aptdir/old
sudo mv $aptdir/apt.conf.d/80snapper $aptdir/old
sudo echo "DPkg::Pre-Invoke { \"$user_home/.config/snapper/dpkg-pre-post-snapper.sh pre\"; };" | sudo tee /etc/apt/apt.conf.d/80snapper
sudo echo "DPkg::Post-Invoke { \"$user_home/.config/snapper/dpkg-pre-post-snapper.sh post\"; };" | sudo tee -a /etc/apt/apt.conf.d/80snapper
