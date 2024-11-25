# Parrot Tools (WIP)

Could not get hyprland to work on vm, so resorting to using sway wm.

## Notes

- Avoid KDE as there are issues with KDE + wayland for VMware copy/paste

## Structure

1. EFI partition - 1.2Gb
2. /tmp - 4GB, ext4
3. / - <remaining space>, btrfs

## Assumptions

- Parrot is up and running

## Add user to sudoers

```bash
su -
sudo echo "<username> ALL=(ALL:ALL) ALL" >> /etc/sudoers
usermod -aG sudo <username>
```

## Change sources

Adjust new packages in `sources.list`
`sudo vi /etc/apt/sources.list.d/sources.list`

```txt
deb http://deb.debian.org/debian/ testing main
deb-src http://deb.debian.org/debian/ testing main

deb http://security.debian.org/debian-security testing-security main
deb-src http://security.debian.org/debian-security testing-security main

# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports
deb http://deb.debian.org/debian/ testing-updates main
deb-src http://deb.debian.org/debian/ testing-updates main
```

To use testing source packages - `apt -t testing install <package>`

Add security preferences to `/etc/apt/preferences.d/security`

```txt
Package: src:chromium src:firefox src:firefox-esr src:linux src:linux-signed-amd64
Explanation: these packages are always security updates updated in unstable first
Pin: release a=/^(unstable|unstable-debug|buildd-unstable|buildd-unstable-debug)$/
Pin-Priority: 980
```

## BTRFS + Snapper

May not be needed but useful to create filesystem snapshots. Can be useful in VM as well to reduce space for taking snapshots.

Use this [guide](https://github.com/david-cortes/snapper-in-debian-guide) to install.

Also install the GUI for easier management `sudo apt install snapper-gui`.

`btrfs-assistant` has more features but tends to segfault.

## Change file manager

```bash
sudo apt install nemo
xdg-mime default nemo.desktop inode/directory application/x-gnome-saved-searc
```

## Terminal Emulator

```bash
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo apt update && sudo apt install wezterm
sudo update-alternatives --config x-terminal-emulator
```

Change keyboard shortcut to redirect to `wezterm`

## ASDF

install asdf

## Swayfx

`sudo apt -t testing install wlroots libpango1.0-dev scdoc fish libgdk-pixbuf-2.0-dev`

### libwlroots

```bash
wget https://gitlab.freedesktop.org/wlroots/wlroots/-/archive/0.17.4/wlroots-0.17.4.tar.gz
tar -xf wlroots-0.17.4.tar.gz
cd wlroots-0.17.4
meson build
ninja -C build
sudo ninja -C build install
```

`sudo apt -t testing install librust-wayland-protocols+wayland-server-dev libdrm-dev libxkbcommon-dev libudev-dev libgbm-dev libvulkan-dev hwdata glslang-tools libinput-dev libxcb-dri3-dev libxcb-present-dev libxcb-render-util0-dev libxcb-xinput-dev libseat-dev libxcb-composite0-dev libxcb-icccm4-dev libxcb-res0-dev libxcb-errors-dev libavutil-dev libavcodec-dev libavformat-dev`

### Scenefx

Using testing repo

`sudo apt -t testing install librust-wayland-server-dev libwlroots-dev`

## References

[Username not in sudoers](https://www.baeldung.com/linux/username-not-in-sudoers-file)
[Installing sid on debian](https://wiki.debian.org/DebianUnstable)
[Debian Testing](https://wiki.debian.org/DebianTesting)
[Main guide to snapper with btrfs](https://github.com/david-cortes/snapper-in-debian-guide)
[Another guide to snapper installation](https://medium.com/@inatagan/installing-debian-with-btrfs-snapper-backups-and-grub-btrfs-27212644175f)
[Wezterm](https://wezfurlong.org/wezterm/install/linux.html)
