#!/bin/bash

echo "Running neovim post installation"
echo "vim.opt.list = false
vim.opt.clipboard = \"unnamed\"" >> $HOME/.config/nvim/lua/core/options.lua
