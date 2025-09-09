# Install scripts
+ These are my scripts to setup new machine.
+ I know they look urgly, but they work.
+ Have a guide just in case I forget how to set things up.

# Guide
## During Void Installer

### Partitions

| Size      | Mount Point   | Type        |
|-----------|---------------|-------------|
| 512 MB    | /boot/efi     | vfat        |
| 4 GB      | -             | linux swap  |
| Rest      | /             | ext4        |

### User Groups

Put yourself in these groups:

- **wheel**: Administrative privileges
- **audio**: Audio device access
- **video**: Video device access
- **users**: General user group

### Services

Enable these services:

- **dbus**: Inter-process communication
- **rtkit**: Manages audio
- **sshd**: SSH daemon
- **uuidd**: Generates UUID
- **NetworkManager**: Manages network

## Post installation
1. Login as root and update system
```
xbps-install -Syu
xbps-install -y git
```
2. Clone this repo to /tmp
```
cd /tmp
git clone --depth 1 -q "https://github.com/YuuMurasaki/setup.git"
cd setup/
```
3. Run install-void.sh as root
```
./install-void.sh
```
4. Compile suckless tools
5. Reboot
```
reboot
```
6. Login as root again and run configuration file
```
./configuration.sh
```
7. Reboot and login as normal user
8. Dotfiles go brrr
```
cd /home/yuu/dotfiles
stow .
```
9. Finish
```
./fontsetup.sh
./ffsetup.sh
./gitsetup.sh
```
