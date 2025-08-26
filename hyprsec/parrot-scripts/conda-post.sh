#!/bin/bash
echo "Running conda post installation actions"

dest=$HOME/.config/fish/conf.d/conda-linux.fish
echo $dest

touch $dest
echo "# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /home/breadthesire/Core/miniconda3/bin/conda
    eval /home/breadthesire/Core/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/home/breadthesire/Core/miniconda3/etc/fish/conf.d/conda.fish"
        . "/home/breadthesire/Core/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/home/breadthesire/Core/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<" > $dest
