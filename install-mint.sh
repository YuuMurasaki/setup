#!/bin/sh

# Update system
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update

# Programming tools
sudo apt-get install -y gcc build-essential gdb
sudo apt-get install -y lua5.1 luarocks luajit
sudo apt-get install -y python3 python3.12-venv python3-pip
sudo apt-get install -y nodejs npm default-jre
sudo apt-get install -y ninja-build gettext cmake ccache git

# Cli tools
sudo apt-get install -y alacritty tmux tree-sitter-cli
sudo apt-get install -y unzip zip tar lzip 7zip lf trash-cli eza
sudo apt-get install -y htop stress-ng xclip
sudo apt-get install -y fzf fd-find ripgrep jq
sudo apt-get install -y yt-dlp mpv nsxiv imagemagick ffmpeg
#sudo apt-get install -y zathura zathura-poppler xwallpaper

# Fonts and icons
sudo apt-get install -y fonts-recommended fonts-noto fonts-hack
sudo apt-get install -y fonts-freefont-otf fonts-roboto fonts-dejavu
sudo apt-get install -y fonts-linuxlibertine fonts-liberation
sudo apt-get install -y fonts-crosextra-carlito fonts-crosextra-caladea
sudo apt-get install -y papirus-icon-theme

# Software
sudo apt-get install -y keepassxc audacious

### Building neovim
git clone https://github.com/neovim/neovim "$HOME/Downloads/neovim"
#cd neovim && git checkout stable
#make CMAKE_BUILD_TYPE=Release
#sudo make install

# Mullvad browser
wget --trust-server-names https://mullvad.net/en/download/browser/linux-x86_64/latest -P ~/Downloads

# Final step
sudo reboot
