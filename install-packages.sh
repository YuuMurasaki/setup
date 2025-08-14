#!/bin/sh

gitmakeinstall() {
    echo "Cloning '$1'..."
    local dir=$(mktemp -d)
    git clone --depth 1 --single-branch --no-tags -q "$1" "$dir"
    cd "$dir" || exit 1
    make clean install >/dev/null 2>&1
    rm -rf "$dir"
    echo "Done!"
}

install_font() {
    echo "Installing fonts..."
    local dir=$(mktemp -d)
    cd "$dir" || exit
    curl -OLs "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz"
    tar -xf JetBrainsMono.tar.xz >/dev/null 2>&1
    mv -- *.ttf /usr/share/fonts/TTF
    rm -rf "$dir"
    echo "Done!"
}

install_dotfiles() {
    sudo -u "yuu" mkdir -p "/home/yuu/dotfiles"
    sudo -u "yuu" \
        git clone --single-branch --no-tags -q \
        "https://github.com/YuuMurasaki/dotfiles.git" "/home/yuu/dotfiles"
}

# Main
echo "Installing packages..."
xbps-install -Syu
TEMP=$(mktemp)
curl -L "" > "$TEMP"
while IFS= read -r package; do
    xbps-install -y "$package"
done < packages.txt

gitmakeinstall https://github.com/YuuMurasaki/st.git
gitmakeinstall https://github.com/YuuMurasaki/dwm.git
gitmakeinstall https://github.com/YuuMurasaki/dmenu.git

install_font
install_dotfiles

reboot
