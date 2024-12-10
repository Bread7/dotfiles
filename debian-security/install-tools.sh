#!/bin/bash

if [[ ${EUID} -ne 0 ]]; then
    echo "[!] root permissions required." 1>&2
    echo "[!] use 'sudo -E ./install-tools.sh' to preserver environment settings"
    exit 1
else
    echo "Installing Additional Tools with root permissions"
fi

update() {
    echo "Updating apt"
    apt update || echo -e "[!] Issue with apt" 1>&2
}

sudo apt install parrot-tools-full

tools_path=$HOME/Core/tools

if [[ ! -d $tools_path ]]; then
    echo "Creating directory"
    mkdir -p $tools_path
fi

echo "Setting up directory"
cd $tools_path

gitInstall() {
    local prog_name="$1"
    local url="$2"
    local dest_dir="/$3"
    if [ -d $tools_path$dest_dir ]; then
        echo "[!] $prog_name exists at $tools_path$dest_dir"
        false
    else
        echo "Installing $prog_name"
        git clone $url $tools_path$dest_dir
        true
    fi
}

# Vulscan
if gitInstall Vulscan https://github.com/scipag/vulscan.git vulscan; then
    ln -s $tools_path/vulscan /usr/share/nmap/scripts/vulscan
fi

# Rockyou
if [[ -f /usr/share/wordlists/rockyou.txt ]]; then
    echo "[!] Rockyou list exists at /usr/share/wordlists/rockyou.txt"
else
    if [[ -f /usr/share/wordlists/rockyou.txt.gz ]]; then
        echo "Decompressing rockyou list"
        gzip -dc </usr/share/wordlists/rockyou.txt.gz >/usr/share/wordlists/rockyou.txt
    fi
fi

# Conda python tools (WIP e.g. pwntools, impacket)

# Burp suite
# see: https://tools.suckless.org/x/wmname/
# see: https://wiki.archlinux.org/title/Java#Impersonate_another_window_manager
# see: https://wiki.archlinux.org/title/Java#Gray_window,_applications_not_resizing_with_WM,_menus_immediately_closing
# see: https://forum.portswigger.net/thread/missing-gui-elements-with-ubuntu-22-04-wayland-565abbae
echo "Installing Burp Suite"
if [[ -f burp_installer.sh ]]; then
    echo "Burp installer script exists. Delete and modify $0 to update product/version/type if needed."
else
    if command -v wmname >/dev/null 2>&1; then
        echo "[!] wmname exists at $(which wmname)"
    else
        gitInstall wmname https://git.suckless.org/wmname wmname
        cd wmname
        sudo make install
        cd $tools_path
        sudo rm -r wmname
    fi
    ## [pro, community]
    product=community
    version="2024.10.3"
    ## [Linux, LinuxArm64, MacOsArm64, MacOsx, Jar, WindowsArm64, WindowsX64]
    type="LinuxArm64"
    wget "https://portswigger.net/burp/releases/startdownload?product=$product&version=$version&type=$type" -O burp_installer.sh
    chmod +x burp_installer.sh
    #./burp_installer.sh
    echo "[!!!] Burp has not been installed, run '.$tools_path/burp_installer.sh' to complete installation"
    echo "[!!!] Symlink burp to /usr/local/bin if needed"
fi

# Adjust permissions to current user
sudo chown -R $USER:$USER $tools_path
