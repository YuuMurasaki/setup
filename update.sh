#!/bin/sh

# Updater script, run this as root user
# Change to root user by running `doas su`

# update packages
xbps-install -Syu xbps        # Because if xbps has newer version, it need to be updated first
xbps-install -Syu

# update /etc/hosts
curl -sL "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts" > /etc/hosts

# TRIM the system
fstrim /

# system reset
printf "1. Restart the system\n2. Shutdown the system\n"
printf "Choose an option: "
read -r choice

if [ "$choice" -eq 1 ]; then
    shutdown -r now
elif [ "$choice" -eq 2 ]; then
    shutdown -h now
else
    exit 0
fi
