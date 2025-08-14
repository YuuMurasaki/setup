#!/bin/sh

xbps-install -Syu
xbps-install -y xorg-server xorg-apps xorg-input-drivers xorg-video-drivers
xbps-install -y base-devel libX11-devel libXft-devel libXinerama-devel libXrandr-devel ncurses
xbps-install -y vulkan-loader mesa-vulkan-intel freetype-devel fontconfig-devel
xbps-install -y xcompmgr xdotool xclip xwallpaper unclutter-xfixes
xbps-install -y exfat-utils xdg-utils xdg-user-dirs dbus dbus-x11
xbps-install -y curl wget ImageMagick ffmpeg slop zathura-pdf-poppler man-db
xbps-install -y NetworkManager pam_rundir pipewire wireplumber alsa-pipewire rtkit
xbps-install -y stow fzf rsync tar zip unzip
xbps-install -y font-iosevka freefont-ttf ttf-ubuntu-font-family liberation-fonts-ttf font-libertine-ttf font-awesome6
xbps-install -y noto-fonts-emoji noto-fonts-cjk noto-fonts-cjk-variable noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-ttf-variable
xbps-install -y tmux neovim lf mpv opendoas nsxiv shotgun zathura
xbps-install -y firefox keepassxc

git clone --depth 1 --single-branch --no-tags -q https://github.com/YuuMurasaki/st.git
git clone --depth 1 --single-branch --no-tags -q https://github.com/YuuMurasaki/dwm.git
git clone --depth 1 --single-branch --no-tags -q https://github.com/YuuMurasaki/dmenu.git
