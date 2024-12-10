#!/bin/bash

scripts="./parrot-scripts"

# Environment
$scripts/force-opengl.sh

# APT
$scripts/install-parrot-packages.sh
sudo $scripts/apt-modification.sh

# Wezterm
$scripts/install-wezterm.sh
$scripts/wezterm-post.sh

# Miniconda
$scripts/install-miniconda.sh
$scripts/conda-post.sh
exec $SHELL
$scripts/conda-plugins.sh

# ASDF
$scripts/install-asdf.sh
$scripts/asdf-post.sh

## Other plugins
$scripts/install-ripgrep-all.sh
$scripts/install-lazygit.sh
$scripts/install-yazi.sh
$scripts/install-starship.sh

# Neovim
$scripts/install-neovim.sh
$scripts/neovim-post.sh

# Misc
$scripts/install-nerdfonts.sh
$scripts/install-tofi.sh
$scripts/install-satty.sh
$scripts/install-swaylock-effects.sh
$scripts/install-calcure.sh
$scripts/install-swww.sh
$scripts/install-waypaper.sh
$scripts/install-git-lfs.sh
$scripts/install-nushell.sh

# VMware copy/paste issue on wayland
$scripts/install-clipnotify.sh
$scripts/install-clipsync.sh

# Greeter with Greetd and GTKGreeter
$scripts/install-greeter.sh

# Post installs
$scripts/symlink-paths.sh

# BTRFS setup
$scripts/post-snapper.sh
$scripts/post-grub-btrfs.sh
$scripts/post-snapper-rollback.sh
$scripts/install-btrfs-assistant.sh

# Custom tools
$scripts/install-tools.sh

# Other small commands
## Add bat themes
batcat cache --build

## Enable password auth for ssh
echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo cp $HOME/.config/wallpapers/nature.jpg /usr/share/backgrounds/
