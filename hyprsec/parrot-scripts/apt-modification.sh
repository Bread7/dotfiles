#!/bin/bash

# Update preferences
echo "Package: *
Pin: release o=Debian
Pin-Priority: 700" > /etc/apt/preferences.d/debian-testing-pinning

# Update sources.list
echo "deb https://deb.debian.org/debian testing main contrib non-free
deb https://security.debian.org/debian-security testing-security main contrib non-free
deb https://deb.debian.org/debian testing-updates main contrib non-free" > /etc/apt/sources.list.d/debian.list

sudo apt update
