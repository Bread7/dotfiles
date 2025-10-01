# Debian Security OS

## WM

- Hyprland (default)
- Swayfx (backup)

## VM settings

- At least 20GB of space due to partition requirements
- Enable 3D / Hardware accleration for grpahics (4GB minimum)

## Setup process

1. Make ISO using the script in `hypr-iso/`: `./<pack_iso.sh> <isofile> luks_password.sh`
2. Run ISO through VM / Physical Hardware (automated process, do not press anything in grub)
3. Go to `core/dotfiles/hyprsec` and run `sudo ./debian-snapper.sh setup` (will reboot afterwards)
4. Go to `core/dotfiles/hyprsec` and run `sudo ./debian-snapper.sh post`
5. Go to `core/dotfiles/hyprsec` and run `sudo ./hyprsec-setup.sh` to automate installation process
6. Restart system `sudo reboot`

### Other setups

1. These require a graphical interface to install
   - Go to `core/tools/` and run `./burp_installer.sh` for installation of burp

## Limitation

- Greetd does not work well with LUKS and gnome keyring thus, require double login to unlock the keyring and authenticate PAM
- Configs for sway not fully up to date
- This uses swayfx > sway so may be slightly outdated
- Certain GUI applications may not work well in wayland so require further configs and testings

## Helpful Links

- [Modify initramfs with auto unlock on boot](https://www.reddit.com/r/pop_os/comments/uhj78q/auto_unlock_gnomekeyring_on_autologin_using_luks/)
- [Dotfile Inspiration](https://github.com/JaKooLit/Debian-Hyprland)
