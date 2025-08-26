# Debian + Parrot Tools (WIP)

I just wanted to try hyprland.

## Notes

- Avoid KDE as there are issues with KDE + wayland for VMware copy/paste

## Structure

Create efi and /boot separately, encrypt physical volume > configure LVM > split LVM separately

1. EFI partition - 1GB, efi
2. /boot - 2GB, ext4
3. /tmp - 4GB, encrypted LVM - btrfs
4. swap - 4GB, encrypted LVM - btrfs
5. / - <remaining space>, encrypted LVM - btrfs

## Add keyboard shortcut to open terminal

Go to Settings > Keyboard > Shortcuts > Custom Shortcuts

```txt
Command: gnome-terminal
Shortcut: Ctrl+alt+t
```

## Add user to sudoers

```bash
su -
sudo echo "<username> ALL=(ALL:ALL) ALL" >> /etc/sudoers
usermod -aG sudo <username>
```

## Change sources

Add config for new sources into `20-tum.conf`

```bash
sudo touch /etc/apt/apt.conf.d/20-tum.conf &&\
sudo chown <username>:<username> 20-tum.conf &&\
sudo echo 'APT::Default-Release "/^testing(|-security|-updates)$/";' &&\
sudo chown root:root 20-tum.conf
```

Adjust new packages in `sources.list`
`sudo vi /etc/apt/sources.list`

```txt
deb http://deb.debian.org/debian/ testing main
deb-src http://deb.debian.org/debian/ testing main

deb http://security.debian.org/debian-security testing-security main
deb-src http://security.debian.org/debian-security testing-security main

# see https://www.debian.org/doc/manuals/debian-reference/ch02.en.html#_updates_and_backports
deb http://deb.debian.org/debian/ testing-updates main
deb-src http://deb.debian.org/debian/ testing-updates main

# Unstable release sources
deb http://deb.debian.org/debian/ unstable main
deb-src http://deb.debian.org/debian/ unstable main

deb http://security.debian.org/debian-security unstable main
deb-src http://security.debian.org/debian-security unstable main
```

To use unstable source packages - `apt -t unstable install <package>`

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

## Install Hyprland

Make sure 3D acceleration is enabled for VM.

Additional steps for VM [here](https://wiki.hyprland.org/Getting-Started/Installation/#running-in-a-vm). Debian's virt installation guide [here](https://wiki.debian.org/KVM)

```bash
sudo apt install kitty hyprland
```

Follow this

## References

[Username not in sudoers](https://www.baeldung.com/linux/username-not-in-sudoers-file)
[Installing sid on debian](https://wiki.debian.org/DebianUnstable)
[Debian Testing](https://wiki.debian.org/DebianTesting)
[Main guide to snapper with btrfs](https://github.com/david-cortes/snapper-in-debian-guide)
[Another guide to snapper installation](https://medium.com/@inatagan/installing-debian-with-btrfs-snapper-backups-and-grub-btrfs-27212644175f)
[Wezterm](https://wezfurlong.org/wezterm/install/linux.html)
