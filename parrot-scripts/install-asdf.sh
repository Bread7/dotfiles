#!/bin/bash

version="v0.14.1"
git clone https://github.com/asdf-vm/asdf.git $HOME/.asdf --branch $version
mkdir -p $HOME/.config/fish/completions
ln -s $HOME/.asdf/completions/asdf.fish $HOME/.config/fish/completions

