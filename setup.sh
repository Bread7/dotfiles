#!/bin/bash

echo "Porting of general configs from unix/ and dotfiles-private/"
stow --target=$HOME unix/
stow --target=$HOME dotfiles-private/
