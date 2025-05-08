#!/bin/bash

echo "Make sure to install in /home/<username>/Core/miniconda3"
file=Miniconda3-latest-Linux-aarch64.sh
#echo $file
curl -O https://repo.anaconda.com/miniconda/$file
bash ./$file
rm $file
exec $SHELL
