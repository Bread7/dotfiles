#!/bin/bash

echo "Install custom clipboard sync into /usr/local/bin (stupid vmware)"
dir=$(pwd)
echo $dir
sudo ln -s $dir/parrot-scripts/clipsync.sh /usr/local/bin/clipsync
