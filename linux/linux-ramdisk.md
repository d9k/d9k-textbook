		http://www.linuxscrew.com/2010/03/24/fastest-way-to-create-ramdisk-in-ubuntulinux/
		mkdir /tmp/ramdisk; chmod 777 /tmp/ramdisk
		sudo mount -t tmpfs -o size=256M tmpfs /tmp/ramdisk/
