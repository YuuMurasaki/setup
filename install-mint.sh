#!/bin/sh

# Update system and repositories, add repos
curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /etc/apt/keyrings/wezterm-fury.gpg
echo 'deb [signed-by=/etc/apt/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
wget -O- https://www.virtualbox.org/download/oracle_vbox_2016.asc | sudo gpg --yes --output /usr/share/keyrings/oracle-virtualbox-2016.gpg --dearmor
sudo add-apt-repository ppa:papirus/papirus
sudo apt-get update

##########################
#### INSTALL PACKAGES ####
##########################

# Libraries
sudo apt-get install -y libx11-dev libxft-dev libxinerama-dev libxrandr-dev
sudo apt-get install -y libxi-dev libgl1-mesa-dev libglu1-mesa-dev libxext-dev libxcursor-dev


# Programming tools
sudo apt-get install -y tcc gcc build-essential gdb clang clang-tools clang-format clang-tidy
sudo apt-get install -y clang clang-tools clang-format clang-tidy llvm lldb
sudo apt-get install -y ninja-build gettext make cmake unzip curl wget
sudo apt-get install -y virtualbox-7.1

# Cli tools
sudo apt-get install -y wezterm yash
sudo apt-get install -y htop stress-ng
sudo apt-get install -y git stow lf trash-cli eza
sudo apt-get install -y fd-find fzf ripgrep xwallpaper
sudo apt-get install -y mpv nsxiv zathura zathura-poppler
sudo apt-get install -y maim imagemagick

# Vietnamese
sudo apt-get install -y fcitx5 fcitx5-unikey fcitx5-configtool

# Install fonts
sudo apt-get install -y fonts-hack fonts-firacode fonts-fira-mono
sudo apt-get install -y fonts-freefont-otf fonts-roboto fonts-dejavu
sudo apt-get install -y fonts-noto-core fonts-noto-extra fonts-noto-ui-core fonts-noto-ui-extra
sudo apt-get install -y fonts-linuxlibertine fonts-liberation
sudo apt-get install -y fonts-crosextra-carlito fonts-crosextra-caladea

# Icons
sudo apt-get install -y papirus-icon-theme

# Large software
sudo apt-get install -y keepassxc
sudo apt-get install -y audacious audacious-plugins
sudo apt-get install -y codeblocks codeblocks-common

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

# Mullvad browser
wget --trust-server-names https://mullvad.net/en/download/browser/linux-x86_64/latest -P ~/Downloads
#cp ~/Downloads/mullvad-browser/start-mullvad-browser.desktop ~/.local/share/applications/

### Starship prompt
#curl -sS https://starship.rs/install.sh | sh

# Setup environment
echo ". /home/yuu/.config/shell/profile" > /home/yuu/.profile
echo ". /home/yuu/.config/bash/rc" > /home/yuu/.bashrc

# Clean up
sudo apt-get autoremove -y

# Reboot
sudo reboot
