#!/bin/sh

FONTDIR="$HOME/.local/share/fonts"
mkdir -p "$FONTDIR"
cd "$FONTDIR" || exit

curl -OLs "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
tar -xJf JetBrainsMono.tar.xz
