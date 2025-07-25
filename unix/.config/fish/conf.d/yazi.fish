if type -q yazi;
    function yz --description "Open Yazi but allow change of directory during exit"
        set tmp (mktemp -t "yazi-cwd.XXXXXX")
        yazi $argv --cwd-file="$tmp"
        if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            builtin cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    abbr oldyazi yazi
    abbr yazi yz
end
