#!/bin/sh

FONTDIR=$(mktemp -d /tmp/FONT_XXXX)
cd "$FONTDIR" || exit

curl -OLs "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
tar -xf JetBrainsMono.tar.xz >/dev/null 2>&1
mv -- *.ttf /usr/share/fonts/TTF

rm -rf "$FONTDIR"
fc-cache -f -v
