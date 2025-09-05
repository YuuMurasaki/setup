#!/bin/sh

# Firefox setup script

# Run Firefox headless to generate a profile
firefox --headless >/dev/null 2>&1 &
firefox_pid=$!
sleep 3
kill "$firefox_pid"

# Grab profile
cd "$HOME/.mozilla/firefox"
profile=$(ls | grep "default-default")

# User.js modify
curl -sL "https://raw.githubusercontent.com/arkenfox/user.js/master/user.js" > "$profile/user.js"
curl -sL "https://raw.githubusercontent.com/YuuMurasaki/setup/refs/heads/master/files/extra.js" >> "$profile/user.js"

# For extension, I use
# uBlock-origin and localCDN
