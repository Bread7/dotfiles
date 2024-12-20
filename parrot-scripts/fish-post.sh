#!/bin/bash

echo "Running fish post installation"
dest=$HOME/.config/fish/conf.d

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
source \$HOME/.asdf/asdf.fish

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
