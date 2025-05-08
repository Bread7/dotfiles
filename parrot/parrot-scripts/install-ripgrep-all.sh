#!/bin/bash

echo "Installing ripgrep-all with cargo 25/11/24"

cargo install --locked ripgrep_all
rga --version
