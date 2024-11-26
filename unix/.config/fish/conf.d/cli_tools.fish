# CLI Tools
## TheFuck config
thefuck --alias | source

# Bat > cat configs
abbr oldcat "cat"
#abbr cat "bat --color=always --decorations=always --theme=\"Catppuccin Mocha\" "
## Apply bat configs to man pages
#export MANPAGER="sh -c 'col -bx | bat -l man -p --color=always --decorations=always --theme=\"Catppuccin Mocha\"'"
#export MANROFFOPT="-c" # Uncomment if there are formatting problems on man pages with bat

# Wezterm config
abbr imgcat "wezterm imgcat"

# Dust configs
abbr dust "dust --ignore_hidden"

# Eza configs
#set EZA_CONFIG_DIR "~/.config/eza"
set -Ux LS_COLORS $(vivid generate tokyonight-moon)
abbr oldls "ls"
abbr ls "eza --colour=always --icons=always --classify=always"

# Tldr configs
abbr tldr "tldr --config=$HOME/.config/tldr/config.toml --color=always"

# Ripgrep configs
abbr oldgrep "grep"
abbr ripgrep "rg"
#abbr grep "rg --hidden --no-ignore --pretty"
abbr grep "rg"
set RIPGREP_CONFIG_PATH "$HOME/.config/ripgrep"

# Fd configs
abbr fd "fd --hidden --no-ignore --color=always"

# Bottom configs
abbr bottom "btm"

# Procs configs
abbr procs "procs --theme=dark --color=always --load-config=$HOME/.config/procs/procs.toml"
#abbr ps "procs"

# xh configs
abbr xh "xh --pretty=all"

# Httpie configs
set HTTPIE_CONFIG_DIR "$HOME/.config/httpie"
abbr http "http --pretty=all"

# Lazygit configs
set CONFIG_DIR "$HOME/.config/lazygit"

# Zoxide configs
set _ZO_DATA_DIR "$HOME/.local/share/zoxide"
set _ZO_FZF_OPTS "query --list --score"
abbr oldcd "cd"
abbr cd "z"
zoxide init fish | source

# Yazi configs
set YAZI_CONFIG_HOME "$HOME/.config/yazi"

# FZF configs
fzf --fish | source
## Rose Pine Moon - https://github.com/rose-pine/fzf/blob/main/dist/rose-pine-moon.fish
set -Ux FZF_COLOUR_OPTS "
                       --color=fg:#908caa,bg:#232136,hl:#ea9a97
 	                     --color=fg+:#e0def4,bg+:#393552,hl+:#ea9a97
                       --color=border:#44415a,header:#3e8fb0,gutter:#232136
                       --color=spinner:#f6c177,info:#9ccfd8
                       --color=pointer:#c4a7e7,marker:#eb6f92,prompt:#908caa
                       --multi"
## Catppuccin Mocha theme - https://github.com/catppuccin/fzf
#set -Ux FZF_COLOUR_OPTS "--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
  #                        --color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
  #                    --color=marker:#b4befe,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8 \
  #                    --color=selected-bg:#45475a \
  #                    --multi \
  #                    "
set FZF_DEFAULT_COMMAND "fd --hidden --no-ignore --type file --strip-cwd-prefix --color=always --exclude .git"
set FZF_ALT_COMMAND "rg -uu --files --with-filename --pretty"
set FZF_MOVEMENTS "--bind='ctrl-e:execute(nvim {})' \
                   --bind='ctrl-p:toggle-preview' \
                   --bind='ctrl-u:half-page-up+refresh-preview'
                   --bind='ctrl-d:half-page-down+refresh-preview'
                   --bind='ctrl-a:toggle-all'
                   --bind='ctrl-s:toggle-sort'
                  "
set FZF_DEFAULT_OPTS "$FZF_COLOUR_OPTS $FZF_MOVEMENTS --layout=reverse --border=rounded --cycle --preview-window='right' --preview=$FZF_PREVIEW_COMMAND --ansi"
set FZF_CTRL_T_OPTS "--walker-skip=.git,node_modules,target --preview=$FZF_PREVIEW_COMMAND"
set FZF_ALT_C_OPTS "--walker-skip=.git,node_modules,target --preview 'tree -C {}'"

function yazi-keys -d "Show yazi keymaps"
    $newCat $HOME/.config/yazi/keymap.toml
end

function wezterm-keys -d "Show wezterm keymaps"
    $newCat $HOME/.config/wezterm/config/bindings.lua
end

function fzf-keys -d "Show fzf keys"
    set -f IFS
    echo "FZF Key binds in fish:"
    set -f binds (bind -a | rg --pretty fzf)
    for line in $binds
        echo $line
    end
    #command echo (bind -a | rg --pretty fzf | bat)
    echo
    echo "FZF Key binds in config.fish:"
    $newCat $HOME/.config/fish/conf.d/cli_tools.fish | rg --pretty bind=
end

# Vivid configs
# Choose configs
# Ripgrep-all configs
# Doggo configs
# Curlie configs
