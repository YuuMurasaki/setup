#!/bin/sh

# Blacklist kernel module-------------------------------
printf "blacklist uvcvideo
blacklist chsc_sch
blacklist hisax
blacklist i8xx_tco
blacklist hisax_fcpcipnp
blacklist snd_pcsp
blacklist snd_hda_codec_hdmi
blacklist pcspkr
blacklist bluetooth

install bluetooth /bin/true" > /etc/modprobe.d/blacklist.conf

# Setup doas--------------------------------------------
echo "Configuring doas..."
printf "permit persist :wheel
permit nopass :wheel cmd poweroff
permit nopass :wheel cmd reboot
permit nopass :wheel cmd mount
permit nopass :wheel cmd umount" > /etc/doas.conf

# Setup GRUB--------------------------------------------
echo "Configuring GRUB..."
printf 'GRUB_DEFAULT=0
GRUB_TIMEOUT=0
GRUB_HIDDEN_TIMEOUT=0
GRUB_CMDLINE_LINUX_DEFAULT="loglevel=4"' > /etc/default/grub
update-grub

# Setup $XDG_RUNTIME_DIR--------------------------------
echo "Setting up XDG_RUNTIME_DIR..."
printf "-session	optional	pam_rundir.so" >> /etc/pam.d/login

# Enable sv services------------------------------------
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

# Setup pipewire----------------------------------------
echo "Configuring PipeWire..."
mkdir -p /etc/pipewire/pipewire.conf.d
mkdir -p /etc/alsa/conf.d
ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
ln -s /usr/share/alsa/alsa.conf.d/50-pipewire.conf /etc/alsa/conf.d
ln -s /usr/share/alsa/alsa.conf.d/99-pipewire-default.conf /etc/alsa/conf.d

# Setup /etc/hosts--------------------------------------
echo "Configuring /etc/hosts"
curl -sL "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts" > /etc/hosts

# Prevent login as root---------------------------------
echo "Remove root password"
passwd -ld root
