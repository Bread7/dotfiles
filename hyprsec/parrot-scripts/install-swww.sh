#!/bin/bash

git clone https://github.com/LGFae/swww.git
cd swww
cargo build --release
sudo cp target/release/swww /usr/local/bin
sudo cp target/release/swww-daemon /usr/local/bin
cp completions/swww.fish $HOME/.config/fish/completions/swww.fish
./doc/gen.sh
cd ..
sudo rm -r swww
