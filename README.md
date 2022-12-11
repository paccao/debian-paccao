# Debian Minimal with i3

The Debian configuration was based of https://github.com/ChrisTitusTech/Debian-titus installation script and modified to fit my own needs. Credits to them!

## Requirements

_This install changes Debian to the SID (Dev) Branch_

### Download Debian non-free netinstall

Use the following Debian ISO as the base <https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/>

-   Doublecheck that the link is up to date before downloading.
-   _Do NOT grab the EDU download and this includes non-free and firmware_

### To install, run the following in a terminal:

```
su -
apt update &&
apt-get update &&
apt install sudo -y
usermod -aG sudo joel # change 'joel' to your $username
id joel # check that your user has the sudo group.
exit
su joel
```

```
sudo apt install git -y
git clone https://github.com/paccao/debian-paccao
cd debian-paccao
chmod +x install.sh
sudo ./install.sh
```

The script will prompt you to reboot, after that is done, run:

```
cd ~/debian-paccao
chmod +x post-install.sh
./post-install.sh
```

## How to fix sudo command not found

-   https://linuxhint.com/how-to-fix-debian-sudo-command-not-found/#:~:text=By%20default%20in%20Debian%2C%20the,it%20generates%20the%20following%20error.&text=So%20it%20means%20that%20the,mode%20and%20install%20the%20package.

## How to configure X server xinit and autostart i3 on login

-   https://wiki.archlinux.org/title/Xinit#Configuration
-   https://wiki.archlinux.org/title/Xinit#Autostart_X_at_login

## Helpful blog post to configure your install script

-   https://medium.com/hacker-toolbelt/i3wm-on-debian-10-buster-c302420853b1

## How to install the vim plugin YouCompleteMe:

-   https://ethans.me/posts/2018-09-01-installing-vim-with-youcompleteme-plugin-to-enable-autocomplete/
