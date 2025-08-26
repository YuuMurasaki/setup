# Install scripts
+ These are my scripts to setup new machine.
+ I know they look urgly, but they work.
+ Have a guide just in case I forget how to set things up.

# Guide
1. Login as root and update system
```
xbps-update -Syu
xbps-install -y git
```
2. Clone this repo to /tmp
```
cd /tmp
git clone --depth 1 -q "https://github.com/YuuMurasaki/setup.git"
cd setup
```
3. Run install-void.sh as root
```
./install-void.sh
```
4. Compile suckless tools
5. Install nerd fonts
```
./fontsetup.sh
```
6. Reboot
```
reboot
```
7. Login as root again and run configuration file
```
./configuration.sh
```
8. Exit root and login as normal user
9. Dotfiles go brrr
```
cd /home/yuu/dotfiles
stow .
```
10. Setup home directory
+ Put wallpaper to ~/.local/share/wallpaper/wallpaper.png
+ Run these scripts as normal user
```
./ffsetup.sh
./gitsetup.sh
```
# Update
Need to keep an eye on updates
+ Update system
```
xbps-install -Syu
```
+ Update firefox user.js
```
./ffsetup.sh
```
+ Update /etc/hosts
