#!/bin/sh

TEMP=$(mktemp -d)
cd "$TEMP" || exit

curl -OLs "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
tar -xJf JetBrainsMono.tar.xz

FONT_DIR="/usr/share/fonts/TTF/"
mv -- *.ttf "$FONT_DIR"
