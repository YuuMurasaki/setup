#!/bin/sh

echo -n "Name: " && read name
echo -n "Email: " && read email

git config --global user.name "$name"
git config --global user.email "$email"
git config --global core.editor "nvim"
git config --global core.compression 0
git config --global core.whitespace error
git config --global color.ui auto
git config --global diff.context 3
git config --global interactive.singlekey true
git config --global init.defaultBranch master
git config --global commit.template "/home/yuu/.config/git/commit-template"

echo "Git configuration completed successfully."
