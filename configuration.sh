#!/bin/sh

# Enable sv services
echo "Removing existing services..."
rm -r /var/service/dhcpcd
rm -r /var/service/dhcpcd-eth0
rm -r /var/service/agetty-tty4
rm -r /var/service/agetty-tty5
rm -r /var/service/agetty-tty6

echo "Linking new services..."
ln -s /etc/sv/NetworkManager/ /var/service/
ln -s /etc/sv/rtkit/ /var/service/
ln -s /etc/sv/dbus/ /var/service/

# Setup $XDG_RUNTIME_DIR
echo "Setting up XDG_RUNTIME_DIR..."
echo "-session    optional    pam_rundir.so" >> /etc/pam.d/login

# Setup doas
echo "Configuring doas..."
touch /etc/doas.conf
echo "
permit persist :wheel
permit nopass :wheel cmd poweroff
permit nopass :wheel cmd reboot
permit nopass :wheel cmd mount
permit nopass :wheel cmd umount
" > /etc/doas.conf
chmod 444 /etc/doas.conf
echo "doas configuration complete."

# Setup pipewire
echo "Setting up PipeWire..."
mkdir -p /etc/pipewire/pipewire.conf.d
mkdir -p /etc/alsa/conf.d
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d
echo "PipeWire setup complete."

# Setup /etc/hosts
echo "Setting up /etc/hosts"
curl -sL "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts" > /etc/hosts

# Prevent login as root
echo "PermitRootLogin no" >> /etc/ssh/ssh_config
passwd -l root
