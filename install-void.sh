#!/bin/sh

xbps-install -Syu
xbps-install -y xorg-server xorg-apps xorg-input-drivers xorg-video-drivers
xbps-install -y libX11-devel libXft-devel libXinerama-devel libXrandr-devel
xbps-install -y base-devel ncurses-devel
xbps-install -y dbus pam_rundir NetworkManager
xbps-install -y pipewire wireplumber alsa-pipewire rtkit

xbps-install -y freetype-devel fontconfig-devel
xbps-install -y noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji
xbps-install -y noto-fonts-ttf-extra noto-fonts-cjk-variable noto-fonts-ttf-variable
xbps-install -y font-iosevka ttf-ubuntu-font-family font-awesome6
xbps-install -y liberation-fonts-ttf font-libertine-ttf freefont-ttf

xbps-install -y xcompmgr xclip xwallpaper unclutter-xfixes
xbps-install -y curl ImageMagick ffmpeg opendoas
xbps-install -y stow rsync tar zip unzip
xbps-install -y mpv nsxiv zathura zathura-pdf-poppler
xbps-install -y tmux neovim lf fzf ripgrep

xbps-install -y firefox keepassxc

#xbps-install -y intel-video-accel vulkan-loader
#xbps-install -y mesa-dri mesa-vulkan-intel mesa-vaapi mesa-vdpau
#xbps-install -y slop shotgun xdg-user-dirs exfat-utils

cd /tmp
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/st.git"
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/dwm.git"
git clone --depth 1 --single-branch --no-tags -q "https://github.com/YuuMurasaki/dmenu.git"

sudo -u "yuu" mkdir -p /home/yuu/.ssh
sudo -u "yuu" mkdir -p /home/yuu/workspace/repos
sudo -u "yuu" mkdir -p /home/yuu/workspace/testing

cd /home/yuu
sudo -u "yuu" git clone --depth 1 -q "https://github.com/YuuMurasaki/dotfiles.git"

cd /home/yuu/workspace/repos
sudo -u "yuu" git clone --depth 1 -q "https://github.com/YuuMurasaki/setup.git"
