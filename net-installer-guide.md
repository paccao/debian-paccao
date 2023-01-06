# This guides you through what options I picked in the netinstaller.

![Pick installation type](netinstaller-screenshots/1.png?raw=true)\
_Note that your installation process may look different from mine depending on what version you are on and what hardware you have._

Select 'Installer'.\
Select your preferred language, location, locales (language) and the language of your keyboard.

Then set your hostname. This is just the name of your computer, I picked 'debianbox'.\
![Configure network, domain name](netinstaller-screenshots/3.png?raw=true)\
Set your domain name, I recommend '.local'. You can read this [post on StackOverflow](https://superuser.com/questions/889456/correct-domain-name-for-a-home-desktop-linux-machine) for more information.\
Set up users and passwords as you like. You should always use strong passwords, especially if you use your device in public or if you plan on using ssh for example. 12 characters with at least one of the following: Uppercase letter, lowercase letter, number and a special character. Use a password manager. 'keepassxc'.\
Set up your user account by following the prompt.

Partitioning disks can be tricky depending on your specific case and I would recommend looking up external guides on this topic. I will use the partitioning method Guided - use entire disk, but if I was setting up a laptop for work or similar I would definately use the option 'Guided - use entire disk and set up encrypted LVM'. Disk encryption is a password you enter once every time your computer starts which protects your data if your device would get stolen.\
_Warning!_ Partitioning disks erases the data on that disk.

For the partitioning scheme I picked 'All files in one partition (recommended for new users).\
Finish the section of disk partitioning and write the changes to your disk.\
This may take a while.

Under the next step I skipped scanning for extra installation media.

Now let's set your location and a Debian archive mirror. I picked the pre-highlighted defaults, but all of the options are generally fine. This tells the package manager where it shall download files from when you download and update packages on your system. There are more advanced ways to set this up but for now it doesn't really matter that much.

I left the HTTP proxy information field blank.

![Select default desktop environment and software](netinstaller-screenshots/4.png?raw=true)\
_Warning!_ In the next step don't press ENTER on your keyboard until ready under software selection as you get no option to cancel the installation.\
Under software selection I UNCHECKED 'Debian desktop environment' and also unchecked 'GNOME' as I personally don't want them on my system. You can definately still install Gnome if you want it side by side of i3 if you are new to Linux so you always have a backup environment.

I kept standard system utilities, but you may remove them if you feel spicy. [A quick google search on what they include](https://unix.stackexchange.com/questions/307600/whats-the-consequences-if-i-dont-install-the-standard-system-utilities-of-de)\
Uncheck with SPACEBAR, move with arrow keys and enter to continue.

Install GRUB boot loader on your primary drive, select what drive to install on. I picked what the installer recommended me, /dev/sda. This most likely depends on your system.

After your netinstaller is finished, reboot your system. You can now follow the README.md file for the next steps of the installation.
