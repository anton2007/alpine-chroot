# alpine-chroot
Script that installing chroot in all UNIX systems with busybox and coreutils ( include Android )
to install this in Android you need only root, busybox and Terminal emulator ( not Termux )
# Installing on Android
to install this run this commands:
cp /path/to/install.sh ~/
su
cd ~/
chmod 777 installer.sh
./installer.sh
# changing OS install settings
all settings saved in script as variables!
you can edit $ARCH variable to install Alpine chroot for any CPU architecture
