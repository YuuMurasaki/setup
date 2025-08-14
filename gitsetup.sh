#!/bin/sh

echo -n "Name: " && read name
echo -n "Email: " && read email

git config --global user.name "$name"
git config --global user.email "$email"
git config --global core.editor "nvim"
git config --global color.ui auto
git config --global init.defaultBranch master
git config --global commit.template "/home/yuu/.config/git/git-commit-template"

echo "Git configuration completed successfully."
