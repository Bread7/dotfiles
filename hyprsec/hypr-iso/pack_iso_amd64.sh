#!/bin/bash

if [ $(uname) = "Darwin" ]; then
    DARWIN_FLAG=0
    CPIO_BIN="/opt/homebrew/opt/cpio/bin/cpio"
elif [ $(uname) = "Linux" ]; then
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
elif ! check_command dd; then
    echo "Missing dd binary."
    exit 1
fi

print_help() {
    echo "Usage: ./$0 <path/to/iso> <path/to/preseed.cfg> <path/to/partition_recipe> <path/to/latecommand_script>"
    echo "WARNING: Make sure the args are correct as no checks are done and can cause irreversible damage."
}
# Packing Guide: https://wiki.debian.org/DebianInstaller/Preseed/EditIso

if [ $1 = "-h" ]; then
    print_help
    exit 0
elif [ $1 = "--help" ]; then
    print_help
    exit 0
elif [ "$#" -lt 4 ]; then
    echo "Error: Not enough args passed for this script."
    exit 1
fi

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo "sudo $0 $*"
    exit 1
fi

TARGET_DIR=isofiles
TARGET_ARCH=install.amd

# Extract iso
xorriso -osirrox on -indev $1 -extract / $TARGET_DIR

# Extract MBR template from iso
MBR_TEMPLATE=isohdpfx.bin
dd if=$1 bs=1 count=432 of="$MBR_TEMPLATE"


# Add Preseed and partiion recipe into initrd
chmod -R +w "$TARGET_DIR/$TARGET_ARCH"
gunzip "$TARGET_DIR/$TARGET_ARCH/initrd.gz"
cp $2 $TARGET_DIR
cp $3 $TARGET_DIR/recipe
# Add if not empty
if [[ ! -z "$4" ]]; then
    cp "$4" $TARGET_DIR/late_commands.sh
fi
echo "$2" | $CPIO_BIN -H newc -o -A -F "$TARGET_DIR/$TARGET_ARCH/initrd"
gzip "$TARGET_DIR/$TARGET_ARCH/initrd"
chmod -R -w "$TARGET_DIR/$TARGET_ARCH"

# TODO: MD5sum checks

# Modify GRUB params
# https://serverfault.com/questions/1162650/auto-boot-on-preseed-uefi-debian-12-image
chmod -R +w "$TARGET_DIR/boot"
awk '/\/vmlinuz / && !flag { sub(/\/vmlinuz /, "\/vmlinuz auto=true priority=critical preseed\/file=\/cdrom\/preseed.cfg "); flag = 1 } { print }' "$TARGET_DIR/boot/grub/grub.cfg" > "$TARGET_DIR/boot/grub/temp_grub.cfg"
mv "$TARGET_DIR/boot/grub/temp_grub.cfg" "$TARGET_DIR/boot/grub/grub.cfg"
echo "set timeout=1" >> "$TARGET_DIR/boot/grub/grub.cfg"
chmod -R -w "$TARGET_DIR/boot"

# Pack new ISO image
xorriso -as mkisofs \
    -r -V 'Debian amd64 n' \
    -o custom-amd64deb.iso \
    -J -J -joliet-long -cache-inodes \
    -isohybrid-mbr "$MBR_TEMPLATE" \
    -b isolinux/isolinux.bin \
    -c isolinux/boot.cat \
    -boot-load-size 4 -boot-info-table -no-emul-boot \
    -eltorito-alt-boot \
    -e boot/grub/efi.img \
    -no-emul-boot -isohybrid-gpt-basdat -isohybrid-apm-hfsplus \
    "$TARGET_DIR"

# Cleanup
rm $MBR_TEMPLATE
rm -r $TARGET_DIR
echo "WARNING: This ISO will wipe out existing partition in the system unless configured in preseed and/or partition layout."
