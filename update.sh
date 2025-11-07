#!/bin/sh

# Updater script, run: doas ./update.sh

# update packages
xbps-install -Syu xbps        # If xbps has newer version, it need to be updated first
xbps-install -Syu

# TRIM the system
fstrim /

# Shutdown
shutdown -h now
