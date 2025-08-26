#!/bin/bash

echo "Installing conda plugins, require conda env to be set up and activated"
echo "Restart shell if there are any issues"

python3 -m pip install --user pipx
python3 -m pipx ensurepath
sudo pipx ensurepath --global
