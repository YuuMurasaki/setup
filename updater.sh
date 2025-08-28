#!/bin/sh

doas su
xbps-install -Syu
curl -sL "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling-porn-social/hosts" > /etc/hosts
shutdown -h now
