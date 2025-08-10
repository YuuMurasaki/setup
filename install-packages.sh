#!/bin/sh

xbps-install -Syu
xbps-install -y xorg-server xorg-apps xorg-input-drivers xorg-video-drivers
xbps-install -y xcompmgr xdotool xclip xwallpaper unclutter-xfixes
xbps-install -y vulkan-loader mesa-vulkan-intel
xbps-install -y base-devel libX11-devel libXft-devel libXinerama-devel libXrandr-devel ncurses
xbps-install -y freetype-devel fontconfig-devel xdg-utils xdg-user-dirs
xbps-install -y dbus dbus-x11 pam_rundir NetworkManager
xbps-install -y pipewire wireplumber rtkit alsa-pipewire
xbps-install -y git curl wget ImageMagick ffmpeg
xbps-install -y stow slop zathura-pdf-poppler
xbps-install -y fzf rsync tar zip unzip
xbps-install -y font-iosevka freefont-ttf dejavu-fonts-ttf ttf-ubuntu-font-family
xbps-install -y liberation-fonts-ttf font-libertine-ttf font-awesome6
xbps-install -y noto-fonts-emoji noto-fonts-cjk noto-fonts-cjk-variable noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-ttf-variable
xbps-install -y neovim lf mpv opendoas nsxiv shotgun zathura firefox keepassxc

reboot
