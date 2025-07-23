#!/bin/sh

# Create a temporary directory for fonts
FONTDIR=$(mktemp -d /tmp/tmp-fonts.XXXXXX)

# Change to the temporary directory
cd "$FONTDIR" || exit 1

# Download the font files into the temporary directory
curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz" || { echo "Failed to download"; exit 1; }
tar -xf JetBrainsMono.tar.xz || { echo "Failed to extract tar files"; exit 1; }

# Move to the system fonts directory, forcing replacement
find . -name "*.ttf" -exec mv -f {} /usr/share/fonts/TTF \; || { echo "Failed to move TTF fonts"; exit 1; }

# Update the font cache
fc-cache -f -v || { echo "Failed to update font cache"; exit 1; }

# Clean up the temporary directory
rm -rf "$FONTDIR"
echo "Fonts installed successfully."
