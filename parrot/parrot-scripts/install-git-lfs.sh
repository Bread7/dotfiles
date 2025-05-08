#!/bin/bash

sudo os=debian dist=bookworm ./git-lfs-setup.sh
sudo apt update && sudo apt install git-lfs
