# Install scripts
+ These are my scripts to setup new machine.
+ I know they look urgly, but they work.
+ Have a guide just in case I forget how to set things up.

# Guide
1. Update the system and install git
```
xbps-update -Syu
xbps-install -y git
```
2. Clone this repo
```
git clone --depth 1 -q "https://github.com/YuuMurasaki/setup.git"
cd setup
```
3. Run install-void.sh
```
./install-void.sh
```
4. Compile suckless tools
5. Reboot
```
reboot
```
6. Run configuration
```
./configuration.sh
```
7. Dotfiles go brr
```
cd /home/yuu/dotfiles
stow .
```
8. Setup home directory
+ Put wallpaper to ~/local/share/wallpaper/wallpaper.png
+ Run these scripts
```
./ffsetup.sh
./gitsetup.sh
```
# Update
Need to keep an eye on updates
+ update system
```
xbps-install -Syu
```
+ update /etc/hosts
+ update firefox user.js
