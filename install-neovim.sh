#!/bin/sh

# This script requires running as root

install_prerequisites() {
    if command -v apt-get >/dev/null 2>&1; then
        apt-get update && apt-get install -y git ninja-build gettext cmake curl build-essential
    elif command -v apk >/dev/null 2>&1; then
        apk update && apk add alpine-sdk cmake coreutils gettext-tiny-dev ccache ninja-build
    else
        echo "Can't find a supported package manager." && exit 1
    fi
}

build_neovim() {
    install_prerequisites

    INSTALL_DIR="/usr/local/software"
    [ ! -d "$INSTALL_DIR" ] && mkdir -p "$INSTALL_DIR"

    cd "$INSTALL_DIR" && git clone https://github.com/neovim/neovim && cd neovim || exit
    make CMAKE_BUILD_TYPE=RelWithDebInfo
    make install

    echo "Neovim built and installed successfully."
}

# Prompt user for confirmation
echo "Build Neovim from source? [Y/n]"
read -r response
response=${response:-Y}

if [ "$response" = "Y" ] || [ "$response" = "y" ]; then
    echo "Starting the build process..."
    build_neovim
else
    echo "Aborted."
    exit 0
fi
