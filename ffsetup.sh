#!/bin/sh

# Firefox Setup Script

# Run Firefox headless to generate a profile
firefox --headless >/dev/null 2>&1 &
firefox_pid=$!
sleep 3
kill "$firefox_pid"

# Grab profile
profile="$HOME/.mozilla/firefox/*default-default*"
[ ! -d "$profile" ] && exit 1

# User.js modify
curl -sL "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js" > "$profile/user.js"
curl -sL "https://raw.githubusercontent.com/YuuMurasaki/setup/refs/heads/master/files/extra.js" >> "$profile/user.js"
