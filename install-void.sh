#!/bin/sh

xbps-install -Syu
xbps-install -y xorg-server xorg-apps xorg-input-drivers xorg-video-drivers ncurses
xbps-install -y base-devel libX11-devel libXft-devel libXinerama-devel libXrandr-devel
xbps-install -y freetype-devel fontconfig-devel NetworkManager
xbps-install -y exfat-utils xdg-user-dirs dbus dbus-x11 pam_rundir
xbps-install -y curl wget ImageMagick ffmpeg zathura-pdf-poppler
xbps-install -y xcompmgr xdotool xclip xwallpaper unclutter-xfixes
xbps-install -y pipewire wireplumber alsa-pipewire rtkit
xbps-install -y stow fzf rsync tar zip unzip lf
xbps-install -y font-iosevka ttf-ubuntu-font-family font-awesome6
xbps-install -y noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji
xbps-install -y noto-fonts-ttf-extra noto-fonts-cjk-variable noto-fonts-ttf-variable
xbps-install -y tmux neovim mpv nsxiv zathura opendoas
xbps-install -y firefox keepassxc
#xbps-install -y vulkan-loader mesa-vulkan-intel slop shotgun
#xbps-install -y liberation-fonts-ttf font-libertine-ttf freefont-ttf

cd /tmp
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/st.git"
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/dwm.git"
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/dmenu.git"

sudo -u "yuu" mkdir -p /home/yuu/.ssh
sudo -u "yuu" mkdir -p /home/yuu/workspace/testing
sudo -u "yuu" mkdir -p /home/yuu/workspace/repos

cd /home/yuu
sudo -u "yuu" git clone --depth 1 -q "https://github.com/YuuMurasaki/dotfiles.git"

cd /home/yuu/workspace/repos
sudo -u "yuu" git clone --depth 1 -q "https://github.com/YuuMurasaki/setup.git"
