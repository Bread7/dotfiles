#!/bin/bash

echo "Installing Greetd"
git clone https://git.sr.ht/~kennylevinsen/greetd
cd greetd
cargo build --release
sudo cp target/release/{greetd,agreety} /usr/local/bin/
sudo cp greetd.service /etc/systemd/system/greetd.service
mkdir -p /etc/greetd
sudo cp config.toml /etc/greetd/config.toml
# Create greeteruser
sudo useradd -M -G video greeter
sudo chmod -R go+r /etc/greetd/
systemctl enable --now greetd
cd ..
sudo rm -r greetd

echo "Installing GTKGreet for Greetd"
git clone https://git.sr.ht/~kennylevinsen/gtkgreet
cd gtkgreet
meson build
ninja -C build
sudo cp build/gtkgreet/gtkgreek /usr/local/bin
cd ..
sudo rm -r gtkgreet

echo "Setting up GTKGreet"
if [[ -f /etc/pam.d/greetd ]]; then
    echo "greetd file exists in /etc/pam.d"
    echo "Will not modify the file"
else
    if [[ -f /etc/pam.d/login ]]; then
        echo "Copying /etc/pam.d/login as greetd file in /etc/pam.d"
        sudo cp /etc/pam.d/login /etc/pam.d/greetd
    else
        echo "Login file in pam.d not found. Is PAM installed?"
        exit 1
    fi
fi
echo "Creating greetd environments/commands"
echo "hyprland
sway
bash
fish" | sudo tee /etc/greetd/environments

echo "Creating sway-greet configs"
echo "exec \"gtkgreet -l; swaymsg exit\"

include /etc/sway/config.d/*" | sudo tee /etc/greetd/sway-greet

echo"[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]

# command = \"agreety --cmd /bin/sh\"
# command = \"sway --config ~/.config/sway/config\"

# The user to run the command as. The privileges this user must have depends
# on the greeter. A graphical greeter may for example require the user to be
# in the $(video) group.
# command = \"sway --config /etc/greetd/sway-greet\"
command = \"Hyprland\"
user = \"$whoami\"

[initial_session]
command = \"Hyprland\"
user = \"greeter\"
" | sudo tee /etc/greetd/config.toml

echo "Creating GTKGreet css"
echo "window {
   background-image: url(\"file:///usr/share/backgrounds/nature.jpg\");
   background-size: cover;
   background-position: center;
}

box#body {
   background-color: rgba(60, 56, 54, 0.6);
   border-radius: 10px;
   padding: 50px;
   color: white;
}" | sudo tee /etc/greetd/greet.css

# echo "Installing ReGreet to use with Greetd"
# git clone https://github.com/rharish101/ReGreet
# cd ReGreet
# cargo build --all-features --release
# sudo cp target/release/regreet /usr/local/bin
# sudo cp systemd-tmpfiles.conf /etc/tmpfiles.d/regreet.conf
# cd ..
# sudo rm -r ReGreet
