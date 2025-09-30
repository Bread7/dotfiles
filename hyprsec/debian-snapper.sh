#!/bin/bash
# https://github.com/david-cortes/snapper-in-debian-guide
# THIS ASSUMES /tmp IS ALSO IN ITS OWN PARTITION


help(){
    echo -e "Usage: ./debian-snapper.sh <setup|post|help>
    setup: Create subvol partitions for use. @home, @var@log and @tmp. WARNING: will delete existing /btrfsroot
    post: Run after setup has completed
    help: Print help page\n"
}

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    help
    exit 1
fi


if [ "$#" -lt 1 ]; then
    echo -e "Error: Not enough args passed for this script.\n"
    help
    exit 1
fi

echo "
[*] Running setup for btrfs subvolumes and snapper snapshots.
"

user="bread"
main_partition=$(df --output=source / | tail -n 1)
tmp_partition=$(df --output=source /tmp | tail -n 1)

requirements(){
    apt update
    apt install btrfs-progs python3-btrfsutil gawk inotify-tools make build-essential -y
}

# Mount volume under /btrfsroot
mount_root(){
    echo -e "[**] Recreating /btrfsroot subvol partition."
    if [ -d "/btrfsroot" ]; then
        sudo rm -rf /btrfsroot
    fi
    sudo mkdir -p /btrfsroot
    # Modify fstab with btrfs subvols
    sudo cp /etc/fstab /etc/fstab.original
    printf "$main_partition /btrfsroot    btrfs    defaults,subvolid=5    0    0\n" | sudo tee -a /etc/fstab
    # Reload partition structure
    sudo mount /btrfsroot
}

create_layout(){
    echo -e "[**] Recreating /btrfsroot subvol partition."
    # Home
    sudo btrfs subvol create /btrfsroot/@home
    sudo cp -R --reflink=always /home/$user /btrfsroot/@home
    sudo chown -R $user:$user /btrfsroot/@home/$user
    printf "$main_partition /home    btrfs    defaults,subvol=@home    0    0\n" | sudo tee -a /etc/fstab

    # Logs
    sudo btrfs subvol create /btrfsroot/@var@log
    sudo cp -RT --reflink=always /var/log /btrfsroot/@var@log
    printf "$main_partition /var/log    btrfs    defaults,subvol=@var@log    0    0\n" | sudo tee -a /etc/fstab

    # # Tmp
    # # remove dup entry
    # tmp_status=$(sudo systemctl status tmp.mount | grep active | awk '{ print $2 }')
    # if [ $tmp_status = "active" ]; then
    #     sudo umount /tmp
    #     # symlink to /dev/null to prevent mount on boot
    #     sudo systemctl mask tmp.mount
    # fi
    # sudo sed -i '/\/tmp/d' /etc/fstab
    # sudo btrfs subvol create /btrfsroot/@tmp
    # sudo cp -RT --reflink=always /tmp /btrfsroot/@tmp
    # printf "$tmp_partition /tmp    btrfs    defaults,subvol=@tmp    0    0\n" | sudo tee -a /etc/fstab

    # Cleanup
    # sudo systemctl daemon-reload
    sudo mount /var/log
    sudo reboot
}

post_create_layout(){
    echo -e "[**] Cleaning up /btrfsroot subvol partition excess files."
    # Home
    sudo rm -R /btrfsroot/@rootfs/home/$user

    # Logs
    sudo rm -rf /btrfsroot/@rootfs/var/log/*

    # # Tmp
    # sudo rm -rf /btrfsroot/@rootfs/tmp/*
    # sudo rm -rf /btrfsroot/@rootfs/tmp/.*
}

# Snapper configs
setup_snapper(){
    sudo apt update
    sudo apt install snapper snapper-gui -y

    # Monitor snapshots from root filesystem
    sudo snapper -c root create-config /
    # Create subvol for snapshots
    sudo btrfs subvol create /btrfsroot/@snapshots
    sudo mkdir -p /.snapshots
    printf "$main_partition /.snapshots    btrfs    defaults,subvol=@snapshots    0    0\n" | sudo tee -a /etc/fstab
}

# Make snapshot titles more sane
setup_snapshot_title(){
    snapper_title_path="/usr/local/etc/dpkg-pre-post-snapper.sh"
    curl "https://gist.githubusercontent.com/imthenachoman/f722f6d08dfb404fed2a3b2d83263118/raw/e80365b525d425d5fea83d31009b2590a699c8bd/dpkg-pre-post-snapper.sh" > $snapper_title_path
    sudo chmod +x $snapper_title_path

    sudo cp /etc/apt/apt.conf.d/80snapper /etc/apt/apt.conf.d/80snapper.bak
    sudo cat > /etc/apt/apt.conf.d/80snapper <<EOF
# https://gist.github.com/imthenachoman/f722f6d08dfb404fed2a3b2d83263118
# https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=770938

DPkg::Pre-Invoke { "$snapper_title_path pre"; };
DPkg::Post-Invoke { "$snapper_title_path post"; };
EOF
}

# Update grub-btrfs
setup_grub_btrfs(){
    git clone https://github.com/Antynea/grub-btrfs.git
    cd grub-btrfs
    sudo make
    sudo make install
    sudo systemctl enable grub-btrfsd
    sudo systemctl start grub-btrfsd
    sudo update-grub
    cd .. && sudo rm -r grub-btrfs/
}

# Setup rollback
setup_snapper_rollback(){
    git clone https://github.com/jrabinow/snapper-rollback.git
    cd snapper-rollback
    sudo cp snapper-rollback.py /usr/local/bin/snapper-rollback
    sudo cp snapper-rollback.conf /etc/
    # Update root subvol in config
    sudo sed -i 's/subvol_main = @/subvol_main = @rootfs/g' /etc/snapper-rollback.conf
    cd .. && sudo rm -r snapper-rollback
}

# Route processes
if [ $1 = "setup" ]; then
    requirements
    mount_root
    create_layout
elif [ $1 = "post" ]; then
    requirements
    post_create_layout
    setup_snapper
    setup_snapshot_title
    setup_grub_btrfs
    setup_snapper_rollback
else
    help
    exit 0
fi
