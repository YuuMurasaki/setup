#!/bin/sh

########################################################################
# Make Alpine Linux rolling release
# edit /etc/apk/repositories
# Change the version --> 'edge'
# NOTE: For better security, change the url's from http to https
# Edit: /etc/doas.conf, /etc/passwd
# Setup RUNTIME: add this to /etc/pam.d/login at the end of 'session'
# -session	optional	pam_rundir.so
########################################################################

# Update system and repositories
apk update
apk upgrade --available

# Xorg
setup-xorg-base xinit xrandr xsetroot xcompmgr xset xclip xwallpaper unclutter-xfixes

# Drivers
apk add mesa mesa-dri-gallium mesa-va-gallium
#apk add libva-intel-driver # For Intel < 5th gen
#apk add intel-media-driver # For Intel >= 5th gen
#apk add xf86-video-vboxvideo # For Virtualbox

# Libraries
apk add libx11-dev libxft-dev libxinerama-dev libxrandr-dev ncurses

# D-bus
apk add dbus dbus-x11 pam-rundir
rc-update add dbus default

# Programming tools
apk add alpine-sdk git make patch wget curl
apk add gcc g++ tcc
apk add python3 lua5.1 luarocks luajit
#apk add nodejs npm tree-sitter-cli

# Wifi
apk add networkmanager networkmanager-tui

# Sound
apk add pipewire wireplumber pipewire-pulse pipewire-jack

# Cli tools
apk add bash stow htop
apk add fzf ripgrep fd
apk add eza lf trash-cli rsync
apk add tar zip unzip 7zip lzip
apk add neovim mpv nsxiv maim
apk add imagemagick ffmpeg
apk add zathura zathura-pdf-poppler

# Softwares
apk add librewolf keepassxc

# Fonts and Appearance
apk add adwaita-icon-theme
apk add freetype-dev fontconfig-dev
apk add font-iosevka-base font-jetbrains-mono-nerd font-hack-nerd
apk add font-freefont font-roboto font-dejavu font-ubuntu
apk add font-noto font-noto-extra font-awesome-free
apk add font-linux-libertine font-liberation font-inconsolata

# Add user to groups
adduser yuu audio
adduser yuu input
adduser yuu plugdev

# Reboot
reboot
