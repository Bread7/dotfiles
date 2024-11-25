eval "$(/opt/homebrew/bin/brew shellenv)"

# ASDF configs
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Set path for Nvim's image plugin
set -Ux DYLD_LIBRARY_PATH $(brew --prefix)/lib

# Set path for binutils
#set -gx LDFLAGS "-L/opt/homebrew/opt/binutils/lib"
#set -gx CPPFLAGS "-I/opt/homebrew/opt/binutils/include"
set -gx LDFLAGS "-L/opt/homebrew/opt/libpcap/lib"
set -gx CPPFLAGS "-I/opt/homebrew/opt/libpcap/include"
set -gx PKG_CONFIG_PATH "/opt/homebrew/opt/libpcap/lib/pkgconfig"
fish_add_path /opt/homebrew/opt/libpcap/bin

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

# Set path for Spicetify
set -Ux SPOTIFY_PATH /Applications/Spotify.app/Contents/Resources