#!/bin/sh

xbps-install -Syu
xbps-install -y xorg-server xorg-apps xorg-input-drivers xorg-video-drivers
xbps-install -y base-devel libX11-devel libXft-devel libXinerama-devel libXrandr-devel ncurses
xbps-install -y vulkan-loader mesa-vulkan-intel freetype-devel fontconfig-devel
xbps-install -y xcompmgr xdotool xclip xwallpaper unclutter-xfixes
xbps-install -y exfat-utils xdg-user-dirs dbus dbus-x11 pam_rundir
xbps-install -y curl wget ImageMagick ffmpeg slop zathura-pdf-poppler man-db
xbps-install -y NetworkManager pipewire wireplumber alsa-pipewire rtkit
xbps-install -y stow fzf rsync tar zip unzip lf
xbps-install -y font-iosevka freefont-ttf ttf-ubuntu-font-family liberation-fonts-ttf font-libertine-ttf font-awesome6
xbps-install -y noto-fonts-emoji noto-fonts-cjk noto-fonts-cjk-variable noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-ttf-variable
xbps-install -y tmux neovim mpv opendoas nsxiv shotgun zathura
xbps-install -y firefox keepassxc

cd /tmp
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/st.git"
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/dwm.git"
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/dmenu.git"

sudo -u "yuu" mkdir -p /home/yuu/.ssh
sudo -u "yuu" mkdir -p /home/yuu/workspace/testing
sudo -u "yuu" mkdir -p /home/yuu/workspace/repos
sudo -u "yuu" mkdir -p /home/yuu/pictures/screenshots
sudo -u "yuu" mkdir -p /home/yuu/music

cd /home/yuu
sudo -u "yuu" git clone --depth 1 -q "https://github.com/YuuMurasaki/dotfiles.git"

cd /home/yuu/workspace/repos
sudo -u "yuu" git clone --depth 1 -q "https://github.com/YuuMurasaki/setup.git"
