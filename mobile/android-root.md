Android root
============

Получение root
--------------

	Самое простое - framaroot, версии Android со 2 по 4.
	Ставит supersu.
	Потом желательно поставить BusyBox - там vi, cp и прочее.

Не работающая отладка
---------------------

	% lsusb
	...
	Bus XXX Device YYY: ID <VendorID>:<ProductId> ....

`/etc/udev/rules.d/51-android.rules`:

	SUBSYSTEM=="usb", ATTR{idVendor}=="0bb4", ATTR{idProduct}=="0c03", MODE="0666", OWNER="d9k"	

`~/.android/adb_usb.ini`:

	# .....
	# .....
	0x0bb4


	% sudo service udev restart
	% adb kill-server
	% adb devices
	List of devices attached 
	0123456789ABCDEF        device


Read-only file system.
----------------------

	% adb shell
	$ su
	$ mount -o rw,remount -t yaffs2 /dev/block/mtdblock3 /system

http://stackoverflow.com/questions/7794659/how-to-change-the-hosts-file-on-android