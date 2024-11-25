eval "$(/opt/homebrew/bin/brew shellenv)"
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# PNPM configs
set -gx PNPM_HOME "$HOME/Development/global_node_modules"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval $HOME/opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

# Modifying fish greeting to fastfetch
function fish_greeting
    command fastfetch
end

# VS Code cli init
# string match -q "$TERM_PROGRAM" "vscode"
# and . (code --locate-shell-integration-path fish)
function code
  set location "$PWD/$argv"
  open -n -b "com.microsoft.VSCode" --args $location
end

# Mkdir and cd combination
function mkcd -d "Make a new directory and change into that location"
    if test (count $argv) -lt 1; or test (count $argv) -gt 1
        echo "Only accepts 1 arg"
        return
    end
    #echo $argv[1]
    command mkdir $argv
    cd $argv
end

# Clear and fastfetch combination
function clearfast -d "Clear terminal and call fastfetch"
    command clear
    command fastfetch
end
abbr oldclear clear
abbr clear clearfast

# Add firefox path to fish shell
# There are issues with symbolic linking so just add the path
#set PATH /Applications/Firefox.app/Contents/MacOS/firefox $PATH

# Add local applications / binaries to fish via symbolic linked directory
set PATH $HOME/bin/ $PATH

#export ANDROID_HOME="$HOME/Development/android-sdk"
#export JAVA_HOME="$HOME/Library/Java/JavaVirtualMachines/temurin-18.0.2.1/Contents/Home"
#export JAVA_HOME="/usr/libexec/java_home"

set XDG_CONFIG_HOME "$HOME/.config"

# ASDF configs
source /opt/homebrew/opt/asdf/libexec/asdf.fish
source $HOME/.asdf/plugins/golang/set-env.fish
set RUST_WITHOUT rust-docs
source $HOME/.asdf/plugins/java/set-java-home.fish
fish_add_path $GOBIN

# Docker configs
export PATH="$PATH:/Applications/Docker.app/Contents/Resources/bin/"
## Enable buildkit in cli
export DOCKER_BUILDKIT=1
export COMPOSE_DOCKER_CLI_BUILD=1

# Dotnet configs
export DOTNET_ROOT=$HOME/.asdf/installs/dotnet/8.0.301

# Rust / Cargo binaries path
export PATH="$HOME/.cargo/bin:$PATH"

# Starship configs
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
export STARSHIP_CACHE=$HOME/.cache/starship
#function starship_transient_rprompt_func
#    starship module time
#end
starship init fish | source
#enable_transience

# Git environment settings
set GIT_CONFIG_GLOBAL "$HOME/.config/git"
set GIT_CONFIG_SYSTEM "$HOME/.config/git"

# Custom FZF.fish key bindings
fzf_configure_bindings --directory=\\cX@sf --git_log=\\cX@sl --git_status=\\cX@ss --processes=\\cX@sp --history=\\cX@sr --variables=\\cX@sv
set fzf_preview_dir_cmd "eza --all --colour=always --icons=always --classify=always"
set fzf_preview_file_cmd "bat --color=always --decorations=always"
set fzf_history_time_format "%A - %d/%m/%y, %I:%M:%S %p"
set fzf_diff_highlighter "delta --paging=never --width=20"

# Use `sudo !!` or ALT/OPT + s key bind
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

function nvim-config-del --description "Delete nvim configs (currently default location)"
    command sudo rm -r "$HOME/.local/share/nvim"
    command sudo rm -r "$HOME/.local/state/nvim"
end

# Modify nvim to be the main editor
abbr oldvi vi
abbr oldvim vim
abbr vi nvim
abbr vim nvim

# Set path for Ghidra
#set JAVA_HOME $HOME/Development/malware-analysis/amazon-corretto-11-jdk/Contents/Home
#fish_add_path $HOME/Development/malware-analysis/amazon-corretto-11-jdk/Contents/Home

# Set path for Vale
set -Ux VALE_CONFIG_PATH $HOME/.config/vale/.vale.ini
set -Ux VALE_STYLES_PATH $HOME/.config/vale/styles/

# Set path for Nvim's image plugin
set -Ux DYLD_LIBRARY_PATH $(brew --prefix)/lib

# Set path for Spicetify
set -Ux SPOTIFY_PATH /Applications/Spotify.app/Contents/Resources

# Set path for binutils
#set -gx LDFLAGS "-L/opt/homebrew/opt/binutils/lib"
#set -gx CPPFLAGS "-I/opt/homebrew/opt/binutils/include"
set -gx LDFLAGS "-L/opt/homebrew/opt/libpcap/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/libpcap/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/libpcap/lib/pkgconfig"
fish_add_path /opt/homebrew/opt/libpcap/bin

# Set path for gpg (git signing purposes)
#set -gx GPG_TTY "$(tty)"

# Set path for x86_64 brew
# See: https://stackoverflow.com/questions/71862398/install-python-3-6-on-mac-m1
abbr brew86 "arch -x86_64 /usr/local/bin/brew"
#abbr pyenv86 "arch -x86_64 pyenv"
#abbr conda86 "arch -x86_64 /usr/local/bin/conda"
#set -gx CPPFLAGS "-I(brew86 --prefix libffi)/include -I(brew86 --prefix openssl)/include -I(brew86 --prefix readline)/lib"
#set -gx CFLAGS "-I(brew86 --prefix openssl)/include -I(brew86 --prefix bzip2)/include -I(brew86 --prefix readline)/include -I(xcrun --show-sdk-path)/usr/include -Wno-implicit-function-declaration"
#set -gx LDFLAGS "-L(brew86 --prefix openssl)/lib -L(brew86 --prefix readline)/lib -L(brew86 --prefix zlib)/lib -L(brew86 --prefix bzip2)/lib -L(brew86 --prefix gettext)/lib -L(brew86 --prefix libffi)/lib"
## Providing an incorrect openssl version forces a proper openssl version to be downloaded and linked during the build
#set PYTHON_BUILD_HOMEBREW_OPENSSL_FORMULA "openssl@1.0"

# Postgres 15 on macos
fish_add_path /opt/homebrew/opt/postgresql@15/bin

# For quick one time ssh
abbr ssh1 "ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o \"LogLevel ERROR\""

# SSH initialise keys into system
function ssh-init --description "Initialise private keys into system"
    set dirs $(ls -d $HOME/.ssh/*/)
    for dir in $dirs
        set files $(ls $dir | grep -v "pub")
        for file in $files
            echo -e "adding ssh key: $file"
            ssh-add $dir$file
            echo -e "\n"
        end
    end
end
