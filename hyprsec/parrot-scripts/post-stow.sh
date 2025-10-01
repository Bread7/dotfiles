#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "This script requires sudo permission."
    echo -e "sudo $0 $*\n"
    exit 1
fi

post_wezterm(){
    echo "[*] Running wezterm post installation actions (only for VMs on mac)"
    sed -i 's/ALT/SUPER/g' $SUDO_HOME/.config/wezterm/config/bindings.lua
}

post_neovim(){
    echo "[*] Running neovim post installation"
    echo "vim.opt.list = false
vim.opt.clipboard = 'unnamed'" >> $SUDO_HOME/.config/nvim/lua/core/options.lua
}

post_fish(){
    echo "[*] Running fish post installation"
    dest=$SUDO_HOME/.config/fish/conf.d

    echo "# SSH initialise keys into system
function ssh-init --description \"Initialise private keys into system\"
    for dir in (ls -d \$HOME/.ssh/*/ | awk '{ print \$0 }')
        for file in (ls \$dir | grep -v \"pub\" | awk '{ print \$0 }')
            echo \"adding ssh key: \$file\"
            keychain --clear \$dir\$file
            keychain --agents gpg,ssh \$(gpg --list-secret-keys --with-colons | grep '^sec:' | cut --delimiter ':' --fields 5)
            source \$HOME/.keychain/*-fish
            echo -e \"\\n\"
        end
    end
end

# Custom FZF.fish key bindings
set fzf_preview_file_cmd \"batcat --color=always --decorations=always\"
set FZF_PREVIEW_COMMAND \"batcat --color=always --decorations=always --style=full --wrap=never {}\"

# Bat configs
abbr cat \"batcat --color=always --decorations=always --style=full --wrap=never\"
export MANPAGER=\"sh -c 'col -bx | batcat -l man -p --color=always --decorations=always'\"
export MANROFFOPT=\"-c\"
set newCat batcat --color=always --decorations=always --style=full --wrap=never

# ASDF
# source \$HOME/.asdf/asdf.fish

# SSH + keychain
set GPG_TTY \$(tty)
# abbr ssh-init \"ssh-agent \$SHELL && ssh-init-keys\"
#source \$HOME/.keychain/*-fish
#source \$HOME/.keychain/*-fish-gpg

# BTRFS
abbr btrfs-assistant \"sudo -E btrfs-assistant-bin\"

# Pipx binaries
fish_add_path \$HOME/.local/bin

# OpenGL issue
# see: https://github.com/labwc/labwc/issues/1829
set LIBGL_ALWAYS_SOFTWARE 1
set XDG_SESSION_DESKTOP Hyprland

# Screenshot
# https://github.com/gabm/Satty
abbr grim 'grim -g \"\$(slurp -o -r -c \'#ff0000ff\')\" -t ppm - | satty --filename - --fullscreen --output-filename ~/Pictures/satty-\$(date \'+%Y%m%d-%H:%M:%S\').png'
abbr oldgrim grim

#for dir in (ls -d \$HOME/.ssh/*/ | awk '{ print \$9 }')
        #for file in (ls \$dir | grep -v 'pub' | awk '{ print $9 }')
                #keychain --clear \$dir\$file
        #end
#end
#source \$(ls \$HOME/.keychain | grep fish | awk '{print \$9}')" >$dest/linux-specific.fish

    # Remove macos fish configs
    if [ -f $dest/macos-specific.fish ]; then
        echo "removing macos-specific.fish"
        rm $dest/macos-specific.fish
    fi
}

post_symlink(){
    echo "[*] Additional symlink for post installation"
    sudo ln -s $SUDO_HOME/.local/bin/* /usr/local/bin/
    sudo ln -s $GOBIN/* /usr/local/bin/
}

post_ssh_password(){
    echo "[*] Allowing SSH using password as authentication method"

     ## Enable password auth for ssh
    echo "PasswordAuthentication yes" | sudo tee -a /etc/ssh/sshd_config
    sudo systemctl restart sshd
}

post_background(){
    echo "[*] Copying background from .config to /usr/share/backgrounds"
    
    sudo mkdir -p /usr/share/backgrounds
    sudo cp $SUDO_HOME/.config/wallpapers/nature.jpg /usr/share/backgrounds/
}

post_wezterm
post_neovim
post_fish
post_symlink
post_ssh_password
post_background
