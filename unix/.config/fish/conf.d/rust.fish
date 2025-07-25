if type -q rustup;
    set -f RUST_BINS "$HOME/.rustup/toolchains/stable-aarch64-apple-darwin/bin/"
    set -f RUST_BREW_BINS "$(brew --prefix rustup)/bin"
    if  test -d $RUST_BREW_BINS;
        fish_add_path -m $RUST_BREW_BINS
    else if test -d $RUST_BINS;
        fish_add_path -m $RUST_BINS
    end
end
