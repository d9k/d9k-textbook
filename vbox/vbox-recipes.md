# Рецепты VirtualBox

## Resize hdd

```
VBoxManage modifyhd YOUR_HARD_DISK.vdi --resize SIZE_IN_MB
```

http://askubuntu.com/questions/88647/how-do-i-increase-the-hard-disk-size-of-the-virtual-machine
при ошибке вида `Could not get the storage format of the medium `

```
'C:blablabladisc.vdi' (VERRINVALIDNAME) VBoxManage.exe: error: Details: code VBOXEIPRT_ERROR (0x80bb0005), component Medium, interface IMedium, callee IUnknown VBoxManage.exe: error: Context: "OpenMedium(Bstr(pszFilenameOrUuid).raw(), enmDevType, enmAccessMode, fForceNewUuidOnOpen, pMedium.asOutParam())" at line 178 of file VBoxManageDisk.cpp
```

`VBoxManage list hdds`

для получения UUID

`VBoxManage modifyhd UUID --resize SIZE_IN_MB`

для vdi: (Нельзя менять размер)

```
VBoxManage clonehd mydrive.vdi newdrive.vdi
VBoxManage modifyhd --resize SIZE_IN_MB newdrive.vdi
```


## no usb devices connected (ubuntu host)

	sudo adduser $USER vboxusers

logout user or

	sg vboxusers -c "virtualbox &"

[вопрос на askubuntu.com](http://askubuntu.com/questions/365850/12-04-virtualbox-not-seeing-any-usb-devices-in-the-usb-filters-settings)

## Access web service on guest machine

Add `port forwarding rules` in #VBox NAT Network Adapter settings.