#!/bin/bash

echo "Running wezterm post installation actions (only for VMs on mac)"
sed -i 's/ALT/SUPER/g' $HOME/.config/wezterm/config/bindings.lua
