# Debain Installation

This uses [preseeding](https://www.debian.org/releases/trixie/amd64/apbs02.en.html)

Make sure to place iso files in the same directory as the scripts and to execute the script in this directory.

Command to run: `sudo ./<pack.sh> <path/to/iso> <path/to/other_script>...`

## Dependencies

- mksiofs
- xorriso
- gunzip/gzip
- cpio (GNU)
- gdisk (MacOS) / fdisk (linux)
- dd

## References

- [Initrd preseed into ISO](https://wiki.debian.org/DebianInstaller/Preseed/EditIso)
- [/cdrom and not /hd-media](https://serverfault.com/questions/976544/how-debians-preseed-install-work/976931#976931)
- [Repack options other than amd64](https://wiki.debian.org/RepackBootableISO#Remove_the_unneeded_Jigdo_production_options)
- [Sample script for custom ISO with preseed](https://www.reddit.com/r/debian/comments/1mo9m3n/how_to_make_a_custom_debian_iso_installer/)
- [Guide for preseed process](https://medium.com/@s0mec4t/automating-the-installation-of-debian-with-a-preseed-file-7a8fa6645112)
- [Ansible Proxmox with Preseed](https://github.com/mataborg/ansible-role-proxmox_autoinstall)
- [Log locations for autoinstall](https://unix.stackexchange.com/questions/339730/debian-preseed-doesnt-create-lvms-but-are-in-the-expert-recipe)
- [Partman default configs](https://github.com/kaisenlinux/partman-auto)
- [Automate installation on grub configs](https://serverfault.com/questions/1162650/auto-boot-on-preseed-uefi-debian-12-image)
- [Run late commands from iso](https://askubuntu.com/questions/1082087/preseed-late-command)
