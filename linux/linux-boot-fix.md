Исправление загрузки Linux
==========================

Исправление grub
----------------

	ls -l /dev/disk/by-label/
	sudo fdisk -l
	sudo grub-install /dev/XXX

https://help.ubuntu.com/community/RecoveringUbuntuAfterInstallingWindows

/cow - error

Если не подмонтировать: Подключенные разделы

    df -h

через umount с указанием пути лишние

`os-prober` - detect os partition?

# Boot repair

```
sudo add-apt-repository ppa:yannubuntu/boot-repair
sudo apt-get update
sudo apt-get install boot-repair
```

https://help.ubuntu.com/community/Boot-Repair

# Rescatux

http://www.supergrubdisk.org/rescatux/

# Временное изменение параметра загрузки linux

[grub2 - How do I add a kernel boot parameter? - Ask Ubuntu](https://askubuntu.com/questions/19486/how-do-i-add-a-kernel-boot-parameter)

1) Кнопка `e`
2) Строка, начинающаяся с `linux`
3) Изменить параметры в строке
4) `F10` для загрузки

# Постоянное изменение параметра загрузки linux

`/etc/default/grub`: сделать бэкап и изменить переменную `GRUB_CMDLINE_LINUX_DEFAULT` с параметрами
z
` sudo update-grub`

# Загрузка драйвероа видеокарты amdgpu

[cgmanager fails to start - Linux Mint Forums](https://forums.linuxmint.com/viewtopic.php?t=274420)
[How to Fix - Failed to Start Light Display Manager Error](https://www.debugpoint.com/failed-to-start-lightdm)

Отладка `lightdm`:

`lightdm --testmode --debug`

```
[drm] Failed to open DRM device for pci:0000:01:00.0:
`````

[DRM issues, fails at X startup / Newbie Corner / Arch Linux Forums](https://bbs.archlinux.org/viewtopic.php?id=255103)

`sudo prime-select nvidia`

[Bug #1637733 “freeze on login with prime-select intel” : Bugs : Light Display Manager](https://bugs.launchpad.net/lightdm/+bug/1637733)

[prime-select won't enable use of discrete GPU when booted into intel mode - Graphics / Linux / Linux - NVIDIA Developer Forums (2019)](https://forums.developer.nvidia.com/t/prime-select-wont-enable-use-of-discrete-gpu-when-booted-into-intel-mode/80629/3)

[Nvidia drivers problem - Linux Mint Forums (2019)](https://forums.linuxmint.com/viewtopic.php?t=289890)

https://ubuntu-mate.community/t/vgacon-disables-amdgpu-kernel-modesetting-amdgpu-init/23001/2

`lspci -k | grep -B 2 amd`
`lspci -k | grep amdgpu`

[Bug #1774359 “could not find module by name='off'” : Bugs : nvidia-graphics-drivers-390 package : Ubuntu](https://bugs.launchpad.net/ubuntu/+source/nvidia-graphics-drivers-390/+bug/1774359)

[VGACON disables amdgpu kernel modesetting? : r/linuxquestions](https://www.reddit.com/r/linuxquestions/comments/a4bt3j/vgacon_disables_amdgpu_kernel_modesetting/)

`dmesg | grep amdgpu`

[amdgpu "Fatal error during GPU init"; Ryzen 5600G integrated GPU + kernel 5.14.13 - PGNet Dev](https://lore.kernel.org/all/2303555f-42cd-180c-7a67-1d104bceea7d@gmail.com/)

check if ACPI support is broken or skipped.

`glxinfo | grep Mesa`

`sbios settings` - any of these raise a suspicion?

[How to Install Mesa Drivers on Ubuntu (Latest and Stable)](https://itsfoss.com/install-mesa-ubuntu/)

