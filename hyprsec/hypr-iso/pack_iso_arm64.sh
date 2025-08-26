#!/bin/bash

if [ $(uname) = "Darwin" ]; then
    DARWIN_FLAG=0
    DISK_BIN=gdisk
    CPIO_BIN="/opt/homebrew/opt/cpio/bin/cpio"
elif [ $(uname) = "Linux" ]; then
    DISK_BIN=fdisk
    CPIO_BIN=cpio
fi

check_command() {
    # First arg should always be command name
    if [ "$#" -eq 0 ]; then
        echo "Error: No args passed to check if command exists."
        exit 1
    fi
    if command -v $1 >/dev/null 2>&1; then
        return 0
    fi
    return 1
}

if  ! check_command mkisofs; then
    echo "Missing mkisofs binary."
    exit 1
elif ! check_command xorriso; then
    echo "Missing xorriso binary."
    exit 1
elif ! check_command gunzip; then
    echo "Missing xorriso binary."
    exit 1
elif ! check_command gzip; then
    echo "Missing gzip binary."
    exit 1
# Handle Darwin then linux
elif ! check_command /opt/homebrew/opt/cpio/bin/cpio; then
    if [ "$DARWIN_FLAG" -eq 0 ]; then
        echo "Missing cpio binary from linux."
        exit 1
    fi
    if ! check_command cpio; then
        echo "Missing cpio binary from linux."
        exit 1
    fi
elif ! check_command gdisk; then
    if [ "$DARWIN_FLAG" -eq 0 ]; then
        echo "Missing gdisk binary from linux."
        exit 1
    fi
    if ! check_command fdisk; then
        echo "Missing fdisk binary."
        exit 1
    fi
elif ! check_command dd; then
    echo "Missing dd binary."
    exit 1
fi

print_help() {
    echo "Usage: ./$0 <path/to/iso> <path/to/morescripts>..."
    echo "WARNING: Make sure the args are correct as no checks are done and can cause irreversible damage."
    echo "WARNING: DO NOT RENAME preseed.cfg, late_commands.sh and partition_recipe.txt file. Only adjust the values within it."
}
# Packing Guide: https://wiki.debian.org/DebianInstaller/Preseed/EditIso

if [ $1 = "-h" ]; then
    print_help
    exit 0
elif [ $1 = "--help" ]; then
    print_help
    exit 0
elif [ "$#" -lt 1 ]; then
    echo "Error: Not enough args passed for this script."
    exit 1
fi

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo "sudo $0 $*"
    exit 1
fi

target_dir=isofiles
target_arch=install.a64

# Extract iso
xorriso -osirrox on -indev $1 -extract / $target_dir

# Extract efi.img from iso
skip=$($DISK_BIN -l $1 | sed -n '/Size/,$p' | grep EFI | awk '{ print $2 }')
end=$($DISK_BIN -l $1 | sed -n '/Size/,$p' | grep EFI | awk '{ print $3 }')
## Make sure to account for the current sector
count=$((end - skip + 1))
dd if=$1 bs=512 skip=$skip count=$count of=efi.img

# Add Preseed and partiion recipe into initrd
chmod -R +w "$target_dir/$target_arch"
gunzip "$target_dir/$target_arch/initrd.gz"
cp preseed.cfg $target_dir/preseed.cfg
cp partition_recipe.txt $target_dir/recipe
cp late_commands.sh $target_dir/late_commands.sh
cp .env $target_dir/.env
# Additional shells scripts to be added
# Make sure to make changes into preseed.cfg as well
if [ "$#" -gt 1 ]; then
    for (( i=2; i<=$#; i++ )); do
        cp "${!i}" "$target_dir/${!i}"
    done
fi
# if [[ ! -z "$2" ]]; then
#     cp "$2" $target_dir/late_commands.sh
# fi
echo preseed.cfg | $CPIO_BIN -H newc -o -A -F "$target_dir/$target_arch/initrd"
gzip "$target_dir/$target_arch/initrd"
chmod -R -w "$target_dir/$target_arch"

# TODO: MD5sum checks

# Modify GRUB params
# https://serverfault.com/questions/1162650/auto-boot-on-preseed-uefi-debian-12-image
chmod -R +w "$target_dir/boot"
awk '/\/vmlinuz / && !flag { sub(/\/vmlinuz /, "\/vmlinuz auto=true priority=critical vga=788 preseed\/file=\/cdrom\/preseed.cfg"); flag = 1 } { print }' "$target_dir/boot/grub/grub.cfg" > "$target_dir/boot/grub/temp_grub.cfg"
mv "$target_dir/boot/grub/temp_grub.cfg" "$target_dir/boot/grub/grub.cfg"
echo "set timeout=1" >> "$target_dir/boot/grub/grub.cfg"
chmod -R -w "$target_dir/boot"

# Pack new ISO image
xorriso -as mkisofs \
    -r -V 'Debian arm64 n' \
    -o custom-arm64deb.iso \
    -J -joliet-long -cache-inodes \
    -e boot/grub/efi.img -no-emul-boot \
    -append_partition 2 0xef efi.img \
    -partition_cyl_align all \
    "$target_dir"

# Cleanup
rm efi.img
rm -r "$target_dir"
echo "WARNING: This ISO will wipe out existing partition in the system unless configured in preseed and/or partition layout."
