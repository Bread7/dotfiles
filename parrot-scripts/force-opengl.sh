#!/bin/bash

echo "Force OpenGL acceleration (VM only)"
echo "This sets environment to occur on boot, before login"
echo "see: https://github.com/labwc/labwc/issues/1829"

echo "LIBDL_ALWAYS_SOFTWARE=1" | sudo tee -a /etc/environment
echo -e "\n"
