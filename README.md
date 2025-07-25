# Bread Dotfiles

## Pre Repo setup

### Package Manager

Homebrew: `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

APT: Default on Debian/Ubuntu based systems

Refer: https://brew.sh/

### Git

`brew install git` or `sudo apt install git -y`

### SSH

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
eval "$(ssh-agent -s)"
echo "Host github.com
    AddKeysToAgent yes
    UseKeychain yes
    IdentityFile ~/.ssh/id_ed25519
  " > $HOME/.ssh/config
ssh-add $HOME/.ssh/id_ed25519
ssh -vT git@github.com
```

Refer: https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent

## Submodules

Inital setup: `git submodule update --recursive --remote` or `git submodules update --init --recursive`
Subsequece updates: `git pull --recurse-submodules`

## Dependencies

## Command to run

```sh
stow --target=$HOME <dir name>
```

### Setup vale styles

```sh
vale sync
```

## Post Repo Setup

Follow dotfiles-private/ to setup GPG keys

## Future todos

- Fix debian setup
- Improve docs
- Cleanup code
- Cleanup brewfile
- Use Nix
  - [Determinate Nix Installer](https://github.com/DeterminateSystems/nix-installer)
  - [Nix on MacOS](https://www.youtube.com/watch?v=Z8BL8mdzWHI&t=1103s)
