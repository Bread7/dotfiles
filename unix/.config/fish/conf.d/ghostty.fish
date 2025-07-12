# Zellij configs with Ghostty
if set -q GHOSTTY;
    set -f SESSION_NAME "ghostty-zellij"
    if type -q zellij;
        abbr zj zellij
        abbr zjcode "zellij -n ~/.config/zellij/layouts/code-layout.kdl --session code"
        set ZELLIJ_CONFIG_DIR "$HOME/.config/zellij"

        if test -z $NVIM
            # Create default zellij session if it doesn't exists and update ghostty configs
            if test -z (zellij ls -s | grep $SESSION_NAME); and test -z $ZELLIJ
                # Update ghostty with zellij settings
                cp $HOME/.config/ghostty/config-zellij-active $HOME/.config/ghostty/config

                # Reload ghostty
                switch (uname)
                    case Darwin
                        echo "Reloading ghostty config on MacOS at $(date +%H:%M)..."
                        osascript -e 'tell application "System Events" to keystroke "," using {command down, shift down}'
                    case Linux
                        echo "Reloading ghostty config on Linux at $(date +%H:%M)..."
                end

                zellij -n $HOME/.config/zellij/layouts/base-layout.kdl --session $SESSION_NAME
            # If zellij and nvim not running
            else if test -z $ZELLIJ; and  test -z $NVIM
                zellij -n $HOME/.config/zellij/layouts/base-layout.kdl
            end
        end
    end
end
