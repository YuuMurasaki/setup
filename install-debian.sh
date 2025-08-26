#!/bin/sh

# Update system
sudo apt-get update && apt-get upgrade

# Tools
sudo apt-get install -y rsync build-essential git

# Fonts
sudo apt-get install -y fonts-noto fonts-roboto fonts-firacode
sudo apt-get install -y fonts-freefont-otf fonts-dejavu
sudo apt-get install -y fonts-linuxlibertine fonts-liberation

# Software
sudo apt-get install -y keepassxc audacious geany

cd "$HOME/Downloads"
wget --quiet https://mullvad.net/en/download/browser/linux-x86_64/latest
#wget --quiet https://github.com/FreeTubeApp/FreeTube/releases/download/v0.23.7-beta/freetube_0.23.7_beta_amd64.deb
#wget --quiet https://download.virtualbox.org/virtualbox/7.2.0/virtualbox-7.2_7.2.0-170228~Ubuntu~noble_amd64.deb
