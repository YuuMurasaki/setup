#!/bin/sh

###################################################################################
# To make Alpine Linux a rolling release distro,
# edit the /etc/apk/repositories
# Change the version --> 'edge'
# NOTE: For better security you should probably change the url's from http to https
###################################################################################

# Update system and repositories
apk update
apk upgrade --available

# Xorg 
setup-xorg-base xorg-server xinit xrandr xsetroot
apk add xclip xwallpaper unclutter-xfixes

# Drivers
#apk add mesa mesa-dri-gallium mesa-va-gallium
#apk add libva-intel-driver # For Intel < 5th gen
#apk add intel-media-driver # For Intel >= 5th gen
apk add xf86-video-vboxvideo # For Virtualbox

# Libraries
apk add libx11-dev libxft-dev libxinerama-dev libxrandr-dev
apk add ncurses linux-headers

# Tools
apk add alpine-sdk curl git make stow

# D-bus
apk add dbus dbus-x11
apk add pam-rundir
rc-update add dbus default

# Wifi
#apk add iwd

# Sound
apk add pipewire wireplumber pipewire-pulse

# The most POSIX-compliant shell in the world
# Edit /etc/passwd to change default shell from '/bin/ash' --> '/usr/bin/yash'
apk add yash

# Man pages
#apk add man-db man-pages mandoc

# Fuzzy finder
apk add fzf ripgrep fd

# File manager
apk add lf trash-cli

# Text editor
apk add neovim

# Terminal multiplexer
#apk add tmux

# System monitor
apk add htop

# Music player
#apk add cmus

# Media
apk add nsxiv maim
#apk add imagemagick
#apk add mpv

# PDF viewer
#apk add zathura zathura-pdf-poppler

# Web browsers
apk add librewolf
apk add adwaita-icon-theme hicolor-icon-theme

# Youtube client
apk add freetube

# Passwords
#apk add keepassxc
#apk add pass gnupg

# Fonts
apk add freetype-dev fontconfig-dev
apk add font-iosevka-base
apk add font-jetbrains-mono-nerd
#apk add font-freefont
#apk add font-liberation
#apk add font-roboto
#apk add font-dejavu
#apk add font-noto font-noto-extra
#apk add font-linux-libertine
#apk add font-inconsolata

# Vietnamese
#apk add fcitx5 fcitx5-unikey fcitx5-configtool

# Setup
touch /home/yuu/.profile && echo ". /home/yuu/.config/shell/profile" > /home/yuu/.profile
touch /home/yuu/.yashrc && echo ". /home/yuu/.config/yash/rc" > /home/yuu/.yashrc

# Add user to groups
adduser yuu audio
adduser yuu input

# Clone my suckless
cd /root && git clone https://github.com/YuuMurasaki/suckless.git
cd /home/yuu && git clone https://github.com/YuuMurasaki/dotfiles.git
chown -R yuu: /home/yuu/dotfiles

# REBOOT
reboot
