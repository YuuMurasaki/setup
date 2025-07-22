#!/bin/sh

###################################################################################
# Setup $XDG_RUNTIME_DIR
# edit /etc/pam.d/login
# add at the end of 'session'
# -session    optional    pam_rundir.so
###################################################################################
# Setup pipewire
# ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
# ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
# ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
# ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
###################################################################################
# Disable 'dhcpcd', 'wpa_supplicant' before enable 'NetworkManager'
###################################################################################
# Edit '/etc/default/grub'
# change loglevel=5, timeout=3
###################################################################################

xbps-install -Syu
xbps-install -y xorg xinit xrandr xsetroot xcompmgr xdotool xset xclip xwallpaper xwininfo xprop
xbps-install -y vulkan-loader mesa-vulkan-intel unclutter-xfixes
xbps-install -y base-devel libX11-devel libXft-devel libXinerama-devel libXrandr-devel ncurses
xbps-install -y freetype-devel fontconfig-devel xdg-utils xdg-user-dirs ntfs-3g
xbps-install -y dbus dbus-x11 pam_rundir NetworkManager gnupg pinentry-gtk
xbps-install -y pipewire wireplumber rtkit alsa-pipewire
xbps-install -y git oath-toolkit make curl wget patch gcc lua luarocks LuaJIT
xbps-install -y stow slop zathura-pdf-poppler ImageMagick ffmpeg
xbps-install -y fzf eza rsync tar zip unzip 7zip
xbps-install -y font-iosevka freefont-ttf dejavu-fonts-ttf ttf-ubuntu-font-family
xbps-install -y liberation-fonts-ttf font-libertine-ttf font-awesome6
xbps-install -y noto-fonts-emoji noto-fonts-cjk noto-fonts-cjk-variable noto-fonts-ttf noto-fonts-ttf-extra noto-fonts-ttf-variable
xbps-install -y neovim mpv nsxiv shotgun zathura firefox opendoas

# Setup doas
touch /etc/doas.conf
echo "
permit persist :wheel
permit nopass :wheel cmd poweroff
permit nopass :wheel cmd reboot
permit nopass :wheel cmd mount
permit nopass :wheel cmd umount
" > /etc/doas.conf
chmod 400 /etc/doas.conf

# Setup pipewire
mkdir -p /etc/pipewire/pipewire.conf.d
mkdir -p /etc/alsa/conf.d

reboot
