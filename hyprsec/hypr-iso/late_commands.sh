#!/bin/bash

# Post installation after running all preseed configs
# https://github.com/mataborg/ansible-role-proxmox_autoinstall/blob/main/latecommands.sh
# https://github.com/cn246-admin/mkiso
# https://github.com/Bread7/dotfiles/blob/main/debian-security/debian-security.md

set -x

post_setup() {
    # Add user into sudo group
    # Make sure to adjust the value of the user
    usermod -aG sudo bread

    # Add new sources
    echo 'APT::Default-Release "/^testing(|-security|-updates)$/";' > /etc/apt/apt.conf.d/20-tum.conf

    # Do not format, spacing matters for sources.list
    echo \
"
deb http://deb.debian.org/debian/ testing main
#deb-src http://deb.debian.org/debian/ testing main

deb http://security.debian.org/debian-security testing-security main
#deb-src http://security.debian.org/debian-security testing-security main

# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports
deb http://deb.debian.org/debian/ testing-updates main
#deb-src http://deb.debian.org/debian/ testing-updates main

# Unstable release sources
deb http://deb.debian.org/debian/ unstable main
#deb-src http://deb.debian.org/debian/ unstable main"\
    > /etc/apt/sources.list

    cat > /etc/apt/preferences.d/security << EOF
Package: src:chromium src:firefox src:firefox-esr src:linux src:linux-signed-amd64
Explanation: these packages are always security updates updated in unstable first
Pin: release a=/^(unstable|unstable-debug|buildd-unstable|buildd-unstable-debug)$/
Pin-Priority: 980
EOF

    cat > /etc/apt/sources.list.d/parrot.list << EOF
deb https://deb.parrot.sh/parrot lory main contrib non-free non-free-firmware
deb https://deb.parrot.sh/parrot lory-security main contrib non-free non-free-firmware
deb https://deb.parrot.sh/parrot lory-backports main contrib non-free non-free-firmware
EOF

    cat > /etc/apt/preferences.d/parrot-pin << EOF
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
EOF

    # curl -fsSL https://deb.parrot.sh/parrot/keyring.gpg | gpg --dearmor -o /etc/apt/trusted.gpg.d/parrot-archive-keyring.gpg

    # Handle packages
    apt update

    # Create base directory
    mkdir -p /home/bread/core

    # Get latest dotfiles
    git clone https://github.com/Bread7/dotfiles.git /home/bread/core/dotfiles

    exit 0
}

post_setup
