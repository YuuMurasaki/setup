#!/bin/sh

xbps-install -Syu
xbps-install -y xorg-server xorg-apps
xbps-install -y xf86-input-evdev xf86-input-synaptics xf86-input-libinput
xbps-install -y libX11-devel libXft-devel libXinerama-devel libXrandr-devel ncurses-devel
xbps-install -y autoconf automake binutils bison flex gcc libtool m4 make patch pkg-config
xbps-install -y dbus pam_rundir NetworkManager
xbps-install -y pipewire wireplumber alsa-pipewire rtkit

xbps-install -y freetype-devel fontconfig-devel
xbps-install -y noto-fonts-ttf noto-fonts-cjk noto-fonts-emoji
xbps-install -y noto-fonts-ttf-extra noto-fonts-cjk-variable noto-fonts-ttf-variable
xbps-install -y font-iosevka ttf-ubuntu-font-family font-awesome6
xbps-install -y liberation-fonts-ttf font-libertine-ttf freefont-ttf

xbps-install -y xcompmgr xclip xwallpaper
xbps-install -y curl ImageMagick ffmpeg opendoas
xbps-install -y stow rsync zip unzip xz
xbps-install -y mpv nsxiv zathura zathura-pdf-poppler
xbps-install -y tmux neovim lf fzf

xbps-install -y firefox keepassxc

#xbps-install -y intel-video-accel vulkan-loader xorg-video-drivers
#xbps-install -y xf86-video-intel
#xbps-install -y mesa-dri mesa-vulkan-intel mesa-vaapi mesa-vdpau
#xbps-install -y slop shotgun xdg-user-dirs exfat-utils ripgrep unclutter-xfixes

xbps-remove -RFy linux-firmware-amd linux-firmware-nvidia
xbps-remove -RFy acpid void-artwork oclock xbacklight xcalc xclock xeyes xlogo
xbps-remove -yOo

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
