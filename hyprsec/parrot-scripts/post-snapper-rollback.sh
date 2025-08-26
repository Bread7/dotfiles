#!/bin/bash

echo "Installing snapper rollback"
git clone https://github.com/jrabinow/snapper-rollback.git
cd snapper-rollback
sudo cp snapper-rollback.py /usr/local/bin/snapper-rollback
sudo cp snapper-rollback.conf /etc
sudo sed -i 's/subvol_main = @/subvol_main = @rootfs/g' /etc/snapper-rollback.conf
cd ..
sudo rm -r snapper-rollback
