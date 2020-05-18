Исправление загрузки Linux
==========================

Исправление grub
----------------

	ls -l /dev/disk/by-label/
	sudo fdisk -l
	sudo grub-install /dev/XXX

https://help.ubuntu.com/community/RecoveringUbuntuAfterInstallingWindows

/cow - error
~~~~~~~~~~~~

Если не подмонтировать: Подключенные разделы

    df -h 

через umount с указанием пути лишние

`os-prober` - detect os partition?

Boot repair
-----------

	sudo add-apt-repository ppa:yannubuntu/boot-repair
	sudo apt-get update
	sudo apt-get install boot-repair

https://help.ubuntu.com/community/Boot-Repair


Rescatux
--------

http://www.supergrubdisk.org/rescatux/