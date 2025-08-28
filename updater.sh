#!/bin/sh

sudo su

if command -v xbps-install > /dev/null; then
    xbps-install -Syu
fi

if command -v apt-get > /dev/null; then
    apt-get update && apt-get upgrade -y
fi

curl -sL "https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts" > /etc/hosts
shutdown -h now
