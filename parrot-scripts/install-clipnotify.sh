#!/bin/bash

echo "Installing clipnotify for clip syncing (stupid vmware)"
git clone https://github.com/cdown/clipnotify.git
cd clipnotify
make
sudo make install
cd ..
sudo rm -r clipnotify
