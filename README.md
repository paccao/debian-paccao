# Debian Minimal with i3

The Debian configuration was copied from https://github.com/ChrisTitusTech/Debian-titus installation and modified to fit my own needs. Credits to them!

## Requirements

_This install changes Debian to the SID (Dev) Branch_

### Download Debian non-free netinstall

Use the following Debian ISO as the base <https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/>

_do NOT grab the EDU download and this includes non-free and firmware_

### To install, run the following in a terminal:

```
su -
apt update
apt-get update
apt install sudo -y
usermod -aG sudo joel # change 'joel' to your $username
id joel # check that your user has the sudo group.
exit
su joel
```
```
git clone https://github.com/paccao/debian-paccao
cd debian-paccao
chmod +x install.sh
./install.sh
```

You may need to manually run `sudo dpkg --configure -a` to fix the installation.

## How to install the vim plugin YouCompleteMe:

https://ethans.me/posts/2018-09-01-installing-vim-with-youcompleteme-plugin-to-enable-autocomplete/

## How to fix sudo command not found
https://linuxhint.com/how-to-fix-debian-sudo-command-not-found/#:~:text=By%20default%20in%20Debian%2C%20the,it%20generates%20the%20following%20error.&text=So%20it%20means%20that%20the,mode%20and%20install%20the%20package.

## TODO - figure out why kde plasma gets installed
https://askubuntu.com/questions/727926/how-to-remove-kde-plasma-desktop
https://www.reddit.com/r/debian/comments/daj1kw/help_uninstalling_kde_from_debian/
https://www.cyberciti.biz/faq/debian-ubuntu-linux-find-package-installed-updated-date/
