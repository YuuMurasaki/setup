#!/bin/sh

# Update system and repositories, add repos
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update

##########################
#### INSTALL PACKAGES ####
##########################

# Programming tools
sudo apt-get install -y tcc gcc clang clang-tools luarocks

# Terminal emulator
sudo apt-get install -y wezterm

# Cli tools
sudo apt-get install -y stow git
sudo apt-get install -y htop stress opendoas
sudo apt-get install -y eza trash-cli ripgrep
sudo apt-get install -y mpv nsxiv mupdf cmus lf vis tmux fzf
sudo apt-get install -y ninja-build gettext make cmake unzip curl wget build-essential

# Zip, Tar, etc
sudo apt-get install -y tar 7zip unzip zip

# Vietnamese
sudo apt-get install -y fcitx5 fcitx5-unikey fcitx5-configtool

# Install fonts
sudo apt-get install -y fonts-freefont-otf
sudo apt-get install -y fonts-liberation
sudo apt-get install -y fonts-roboto
sudo apt-get install -y fonts-dejavu
sudo apt-get install -y fonts-noto-core
sudo apt-get install -y fonts-noto-extra
sudo apt-get install -y fonts-linuxlibertine

# Icons
sudo apt-get install -y papirus-icon-theme

# Large software
sudo apt-get install -y keepassxc geany

############################
#### BUILDING SOFTWARES ####
############################

### MacOS theme
cd $HOME/Downloads
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git

### Building neovim
cd $HOME/Downloads
git clone https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

### Starship prompt
curl -sS https://starship.rs/install.sh | sh

# CLEAN UP
sudo apt-get autoremove -y

# REBOOT
sudo reboot
