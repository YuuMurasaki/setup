#!/bin/sh

# Firefox Setup Script

# Run Firefox headless to generate a profile
firefox --headless >/dev/null 2>&1 &
firefox_pid=$!
sleep 3
kill "$firefox_pid"

# Grab profile
name=$(ls /home/yuu/.mozilla/firefox/ | grep "default-default")
profile="$HOME/.mozilla/firefox/$name"
[ ! -d "$profile" ] && exit 1

# Install Arkenfox user.js
curl -sL "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js" > "$profile/user.js"

# Add extra settings to user.js
curl -sL "https://raw.githubusercontent.com/YuuMurasaki/setup/refs/heads/master/files/extra.js" >> "$profile/user.js"
