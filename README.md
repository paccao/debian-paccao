# Debian Minimal with i3

The Debian configuration was copied from https://github.com/ChrisTitusTech/Debian-titus installation and modified to fit my own needs. Credits to them!

## Requirements

_This install changes Debian to the SID (Dev) Branch_

### Download Debian non-free netinstall

Use the following Debian ISO as the base <https://cdimage.debian.org/cdimage/unofficial/non-free/cd-including-firmware/weekly-builds/amd64/iso-cd/>

_do NOT grab the EDU download and this includes non-free and firmware_

### To install, run the following in a terminal:

```
git clone https://github.com/paccao/debian-paccao
cd debian-paccao
chmod +x install.sh
./install.sh
```

You may need to manually run `sudo dpkg --configure -a` to fix the installation.

## How to install the vim plugin YouCompleteMe:

https://ethans.me/posts/2018-09-01-installing-vim-with-youcompleteme-plugin-to-enable-autocomplete/
