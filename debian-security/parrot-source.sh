#!/bin/bash

echo "[*] Adding parrot sources, update and set APT pins"
echo "
deb https://deb.parrot.sh/parrot lory main contrib non-free non-free-firmware
deb https://deb.parrot.sh/parrot lory-security main contrib non-free non-free-firmware
deb https://deb.parrot.sh/parrot lory-backports main contrib non-free non-free-firmware
" | sudo tee /etc/apt/sources.list.d/parrot.list

echo "
Package: *
  Pin: release a=parrot6
  Pin-Priority: 300

  Package: *
  Pin: release a=parrot6-backports
  Pin-Priority: 299

  Package: *
  Pin: release a=parrot6-updates
  Pin-Priority: 300

  Package: *
  Pin: release a=parrot6-security
  Pin-Priority: 300

  Package: *
  Pin: release a=parrot
  Pin-Priority: 300

  Package: *
  Pin: release a=parrot-backports
  Pin-Priority: 299

  Package: *
  Pin: release a=parrot-updates
  Pin-Priority: 300

  Package: *
  Pin: release a=parrot-security
  Pin-Priority: 300
" | sudo tee /etc/apt/preferences.d/parrot-pin

curl -fsSL https://deb.parrot.sh/parrot/keyring.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/parrot-archive-keyring.gpg

sudo apt update
