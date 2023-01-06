# Debian Minimal with i3 window manager

The Debian configuration was based of https://github.com/ChrisTitusTech/Debian-titus installation script and modified to fit my own needs. Credits to them!

### Information

_This installation changes Debian to the SID (Dev) Branch_

### Download Debian non-free netinstall to cherrypick your installation

Use the following Debian ISO as the base <https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/>

-   Doublecheck that the link is up to date before downloading.
-   _Do NOT grab the EDU download and this includes non-free and firmware_

Go through the installation process in debians netinstaller. After rebooting into your main harddrive, you are ready to proceed.


### Check installed packages and total amount of current packages/processes
```shell
# Check which packages are installed:
apt list --installed
# Check amount of packages installed:
apt list --installed | wc -l
# Check amount of processes are active
ps aux | wc -l

# Alternatively use dpkg
dpkg -l
# Search for a specific package
dpkg -l | grep "zstd"
```

### To install, run the following in a terminal:

```shell
su -
apt update &&
apt-get update &&
apt install sudo -y
usermod -aG sudo joel # change 'joel' to your $username
id joel # check that your user has the sudo group.
exit
su joel
```

```shell
sudo apt install git -y
git clone https://github.com/paccao/debian-paccao
cd debian-paccao
chmod +x install.sh
sudo ./install.sh
```

After finishing that, set up xorg to start on boot, run the following post-setup things.

-		Install synth-shell for a better bash prompt, go through the interactive installer.
*IMPORTANT:* I only installed synth-shell-prompt and better-history. You can check that in my .bashrc file. If you would like other features of synth-shell I recommend that you remove the lines from the bottom of my .bashrc file that you have copied that has anything to do with synth-shell. Then run the provided synth-shell script again to get a *clean installation*.
```shell
git clone --recursive https://github.com/andresgongora/synth-shell.git
chmod +x synth-shell/setup.sh
cd synth-shell
./setup.sh
```

```shell
git config --global core.editor "vim"
export EDITOR='/usr/bin/vim'
export SUDO_EDITOR='/usr/bin/vim'
```

-   Autostart programs

```shell
cp /etc/X11/xinit/xinitrc ~/.xinitrc
echo "exec xclip &
exec i3" >> ~/.xinitrc
```

-   Apply changes to your $username, mine is joel.

```shell
su joel
source ~/.bashrc
source ~/.bash_profile
source ~/.bash_aliases
source .xinitrc
```

-   Disable bell sound in terminal

```shell
sudoedit /etc/inputrc
```

Change the line `set bell-style visible` to `set bell-style none`. Alternatively you can comment the old one out and add the new one.

To remove the bell sound from your system completely, edit the following line:

```shell
# rmmod pcspkr
sudoedit /etc/modprobe.d/blacklist.conf
```

Add the following line to the list:

```shell
blacklist pcspkr
```

### Good job!
If you got any problems with the installation, please create an issue here on GitHub and I will look into it. I update this repo with the `update-dotfiles.sh` script from my personal laptop and don't always test the install script. Most likely some packages could be missing which is an easy fix, however the install script is not set up to continue where it crashed so you would have to hack into it and remove the parts from your locally downloaded script and run it again after fixing issues."

Also, some of my keyboard shortcuts I have defined in dotconfig/i3/config may not work on your system depending on your keyboard layout. I recommend you search for your issues or set up your own i3 config using the arch wiki. The arch wiki is like the holy trinity of resources in the Linux space and you will most likely find fixes to caveats and very specific issues to your system there.

*Some helpful commands and tips I can give you:*
My default keybinding to open a terminal is `Super key + Enter`
The `alias` command will give you a hint on what shortcut aliases you can use, this is based on the .bash_aliases file.
Press F1 to get another view of which commands you can run on your system.

### Other potentially helpful resources
## How to fix sudo command not found

-   https://linuxhint.com/how-to-fix-debian-sudo-command-not-found/#:~:text=By%20default%20in%20Debian%2C%20the,it%20generates%20the%20following%20error.&text=So%20it%20means%20that%20the,mode%20and%20install%20the%20package.

## How to manually start wifi with the terminal

Your network may not work properly by default. If you run apt update and it says it cant resolve the repository, follow this guide:

-   https://www.linuxbabe.com/debian/connect-to-wi-fi-from-terminal-on-debian-wpa-supplicant

## How to configure X server xinit and autostart i3 on login

-   https://wiki.archlinux.org/title/Xinit#Configuration
-   https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login

## Helpful blog post to configure your install script

-   https://medium.com/hacker-toolbelt/i3wm-on-debian-10-buster-c302420853b1

## How to install the vim plugin YouCompleteMe:

-   https://ethans.me/posts/2018-09-01-installing-vim-with-youcompleteme-plugin-to-enable-autocomplete/

## Other programs you might want to install
ble.sh
asdf
