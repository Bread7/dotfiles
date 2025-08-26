#!/bin/bash

echo 'deb http://download.opensuse.org/repositories/home:/iDesmI:/more/Debian_Testing/ /' | sudo tee /etc/apt/sources.list.d/home:iDesmI:more.list
curl -fsSL https://download.opensuse.org/repositories/home:iDesmI:more/Debian_Testing/Release.key | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/home_iDesmI_more.gpg > /dev/null
sudo apt update
sudo apt install btrfs-assistant
