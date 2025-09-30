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
3. `sudo ./debian-snapper.sh setup` (will reboot afterwards)
4. `sudo ./debian-snapper.sh post`
5. `sudo ./hyprsec-setup.sh` to automate installation process
6. Follow other commands that needs to be executed

### Other setups

1. A `core/tools/` directory is created within `$HOME` dir with _burp_installer.sh_ for installation of burp: `./burp_installer.sh`

## Limitation

- Greetd does not work well with LUKS and gnome keyring thus, require double login to unlock the keyring and authenticate PAM
- Configs for sway not fully up to date
- This uses swayfx > sway so may be slightly outdated
- Certain GUI applications may not work well in wayland so require further configs and testings

### Helpful Links

- [Modify initramfs with auto unlock on boot](https://www.reddit.com/r/pop_os/comments/uhj78q/auto_unlock_gnomekeyring_on_autologin_using_luks/)
