#!/bin/sh

# Update system
sudo apt-get update && apt-get upgrade

# Fonts
sudo apt-get install -y fonts-recommended fonts-noto fonts-hack
sudo apt-get install -y fonts-freefont-otf fonts-roboto fonts-dejavu
sudo apt-get install -y fonts-linuxlibertine fonts-liberation
sudo apt-get install -y fonts-crosextra-carlito fonts-crosextra-caladea

# Software
sudo apt-get install -y keepassxc audacious

# Mullvad browser
wget --trust-server-names https://mullvad.net/en/download/browser/linux-x86_64/latest -P ~/Downloads

# Final step
sudo reboot
