#!/bin/bash

fonts_path=$HOME/.local/share/fonts
url="https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/"
font="FantasqueSansMono.zip"
wget -P $fonts_path $url$font \
    && cd $fonts_path \
    && unzip $font \
    && rm $font

font="JetBrainsMono.zip"
wget -P $fonts_path $url$font \
    && cd $fonts_path \
    && unzip $font \
    && rm $font

font="Iosevka.zip"
wget -P $fonts_path $url$font \
    && cd $fonts_path \
    && unzip $font \
    && rm $font

cd $fonts_path && fc-cache -fv
