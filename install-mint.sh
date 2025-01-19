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
sudo apt-get install -y tcc gcc clang clang-tools clang-format clang-tidy
sudo apt-get install -y lua5.4 luarocks
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source $HOME/.cargo/env

# Terminal emulator
sudo apt-get install -y wezterm

# Cli tools
sudo apt-get install -y stow git
sudo apt-get install -y htop stress opendoas
sudo apt-get install -y eza trash-cli ripgrep fd-find
sudo apt-get install -y mpv nsxiv lf tmux fzf
sudo apt-get install -y ninja-build gettext make cmake unzip curl wget build-essential

# Vietnamese
sudo apt-get install -y fcitx5 fcitx5-unikey fcitx5-configtool

# Install fonts
sudo apt-get install -y fonts-freefont-otf fonts-liberation fonts-roboto fonts-dejavu fonts-linuxlibertine
sudo apt-get install -y fonts-noto-core fonts-noto-extra fonts-noto-mono fonts-noto-ui-core fonts-noto-ui-extra
sudo apt-get install -y fonts-linuxlibertine
sudo apt-get install -y fonts-crosextra-carlito fonts-crosextra-caladea

# Icons
sudo apt-get install -y papirus-icon-theme

# Large software
sudo apt-get install -y keepassxc geany audacious

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
