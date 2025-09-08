#!/bin/sh

# Updater script, run this as root user
# Change to root user by running `doas su`

# update packages
xbps-install -Syu xbps        # Because if xbps has newer version, it need to be updated first
xbps-install -Syu

# update /etc/hosts
curl -sL "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts" > /etc/hosts

# TRIM the system
fstrim --verbose /
