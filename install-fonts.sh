#!/bin/sh

# Create a temporary directory
FONTDIR=$(mktemp -d /tmp/tmp-fonts.XXXXXX)
cd "$FONTDIR" || exit

# Download the font files
curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
tar -xf JetBrainsMono.tar.xz

# Move fonts
mv -- *.ttf /usr/share/fonts/TTF

# Update the font cache
fc-cache -f -v

# Clean up the temporary directory
rm -rf "$FONTDIR"
