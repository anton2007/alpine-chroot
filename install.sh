DIR="alpine-rootfs/"
VER="3.13"
SUBVER="0"
ARCH="armv7"

SetupChroot() {
	mkdir "$DIR"
	tar -zxf alpine-minirootfs-"$VER"."$SUBVER"-"$ARCH".tar.gz -C "$DIR"
	echo "nameserver 8.8.4.4" > "$DIR"/etc/resolv.conf
	echo "nameserver 8.8.8.8" >> "$DIR"/etc/resolv.conf
	echo "cd $DIR" > start.sh
	echo "busybox mount --bind /dev dev" >> start.sh
	echo "mount -t devpts devpts dev/pts" >> start.sh
	echo "mount -t proc proc proc" >> start.sh
	echo "mount -t sysfs sysfs sys" >> start.sh
	echo "export PATH="$PATH:/usr/sbin:/usr/bin:/usr/local/bin:/sbin:/bin"" >> start.sh
	echo "chroot . /bin/sh" >> start.sh
	echo "umount dev/pts" >> start.sh
	echo "umount dev" >> start.sh
	echo "umount proc" >> start.sh
	echo "umount sys" >> start.sh
	chmod 777 start.sh
}

if [ -e alpine-minirootfs-"$VER"."$SUBVER"-"$ARCH".tar.gz ]
then
	SetupChroot	
else
	wget https://dl-cdn.alpinelinux.org/alpine/v"$VER"/releases/"$ARCH"/alpine-minirootfs-"$VER"."$SUBVER"-"$ARCH".tar.gz
	SetupChroot
fi
