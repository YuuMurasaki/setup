#!/bin/sh

# Update system
sudo apt-get update && apt-get upgrade
sudo apt-get install -y openssh-server ffmpeg imagemagick mpv lf neovim

# Fonts
sudo apt-get install -y fonts-noto fonts-roboto fonts-firacode
sudo apt-get install -y fonts-freefont-otf fonts-dejavu
sudo apt-get install -y fonts-linuxlibertine fonts-liberation

# Software
sudo apt-get install -y keepassxc chromium
