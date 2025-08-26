#!/bin/bash
# This script assumes only 1 key exists in the system

set -x
# Get sudo permissions
# sudo -v
source /root/.env

# Get partition path
# Assuming there is only 1 partition in this system
crypt_part=$(blkid | grep LUKS | awk '{print substr($1, 1, length($1)-1 )}')
echo "DEV: $crypt_part"


# Add new password

echo "YAY_LUKS: $CURRENT_LUKS_PASSWORD"
echo -n "$CURRENT_LUKS_PASSWORD" > /root/old.txt
# mkfifo $pipe_file
# echo -n "$CURRENT_LUKS_PASSWORD" | cryptsetup luksAddKey -d - $crypt_part $pipe_file &
echo -n "$NEW_LUKS_PASSWORD" | cryptsetup -v luksAddKey -d=/root/old.txt $crypt_part
# echo -n "$NEW_LUKS_PASSWORD" > $pipe_file
# rm $pipe_file

# Remove old password
echo -n "$NEW_LUKS_PASSWORD" | cryptsetup -v luksKillSlot $crypt_part 0

# Clear files
rm /root/old.txt

exit 0
