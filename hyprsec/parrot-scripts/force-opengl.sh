#!/bin/bash

echo "Force OpenGL acceleration (VM only)"
echo "This sets environment to occur on boot, before login"
echo "see: https://github.com/labwc/labwc/issues/1829"
echo "see: https://forum.portswigger.net/thread/missing-gui-elements-with-ubuntu-22-04-wayland-565abbae"

echo "LIBGL_ALWAYS_SOFTWARE=1" | sudo tee -a /etc/environment
echo "XWAYLAND_NO_GLAMOR=1" | sudo tee -a /etc/environment
echo -e "\n"
