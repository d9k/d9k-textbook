# Linux: оборудование

## Показать жёсткие диски

(деревом)

`sudo lsblk -o NAME,FSTYPE,SIZE,MOUNTPOINT,LABEL`

[вопрос на askubuntu](http://askubuntu.com/questions/182446/how-do-i-view-all-available-hdds-partitions)

## CPU-Z alternative

```
sudo add-apt-repository ppa:cpug-devs/ppa
sudo apt-get update
sudo apt-get install cpu-g
```

## Узнать тип памяти

`sudo dmidecode --type 17`

## Disable wake on usb

	http://askubuntu.com/questions/152403/how-do-i-make-changes-to-proc-acpi-wakeup-permanent

## Переназначение клавиш геймпада

```
sudo add-apt-repository ppa:ryochan7/antimicro
sudo apt-get update
sudo apt-get install antimicro
```

## Сменить драйвер видеокарты из консоли

```
sudo ubuntu-drivers devices
sudo apt-get install nvidia-361
```

## Reinstall ATI drivers

```
sudo apt-get purge "fglrx.*"
sudo rm /etc/X11/xorg.conf
sudo apt-get update
sudo apt-get install --reinstall xserver-xorg-core libgl1-mesa-glx:i386 libgl1-mesa-dri:i386 libgl1-mesa-glx:amd64 libgl1-mesa-dri:amd64
sudo dpkg-reconfigure xserver-xorg
sudo reboot
```

http://askubuntu.com/a/68312/156571

### Disable bluetooth on startup

`/etc/rc.local`, до `exit 0`

```
rfkill block bluetooth
echo disable > /proc/acpi/ibm/bluetooth
```

http://askubuntu.com/a/2568/156571

### Low level battery warning

`sudo apt-get install libnotify-bin acpi`


```
battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
if [ $battery_level -le 10 ]
then
    notify-send "Battery low" "Battery level is ${battery_level}%!"
fi
```

http://unix.stackexchange.com/a/60936/48167

## Здоровье жёсткого диска

http://superuser.com/questions/171195/how-to-check-the-health-of-a-hard-drive

### Коснольный интерфейс

```
sudo apt-get install smartmontools
sudo smartctl -a /dev/sda | less
```

### Графический интерфейс

+ форматирование дисков

```
sudo apt-get install gnome-disk-utility
gnome-disks
```

### fix block size error

sudo blockdev --getbsz /dev/sdd
sudo dd if=/dev/zero of=/dev/sdd bs=2048 count=32

### Сканер

sudo apt-get install cups
Simple Scan

### MFTMirr doesn't match MFT size

`sudo testdisk`

перезаписать (с бэкапом!) разметку на нужный диск

далее `sudo ntfsfix -b -d /dev/sdc1`

понадобилось перезагрузиться

### Проверка состояния SSD-диска (статус S.M.A.R.T.)

https://askubuntu.com/questions/528072/how-can-i-check-the-smart-status-of-a-ssd-or-hdd-on-current-versions-of-ubuntu-1

```
sudo apt install gsmartcontrol
pkexec gsmartcontrol
```


## Ограничение скорости соединения для приложения (net throttle)

```
sudo apt-get install
trickle -s -d 1000 my-app
```

## Информация о вставленных модулях оперативной памяти

`sudo lshw -C memory`

https://askubuntu.com/questions/391173/how-to-find-the-frequency-and-type-of-my-current-ram

## Sysinfo dump

`inxi -Fxz`

## Запуск скрипта при загрузке/пробуждении

1) В папке `/etc/pm/`

(см. примеры в `/usr/lib/pm-utils/`)

НЕ РАБОТАЕТ?!?!

Thaw - resume from hibernation
resume - wake up from sleep mode

2) `/lib/systemd/system-sleep`

$1 `post|pre`, $2 `suspend`


## Лог загрузки

`dmesg`

## Тише вентиляторы

https://askubuntu.com/a/46135

### Пути к вентиляторам меняются после перезагрузки

https://bbs.archlinux.org/viewtopic.php?id=160537
https://wiki.archlinux.org/index.php/Fan_speed_control#Device_Paths_have_Changed_in_/etc/fancontrol

## Нагрузить процессор

`yes > /dev/null`

## Скролл средней кнопкой мыши

1) Узнать `MOUSE_ID` из `xinput list`

2) Узнать названия свойств из `xinput --list-props $MOUSE_ID`

3) Задать нужные свойства

```
xinput set-prop $MOUSE_ID "libinput Scroll Method Enabled" 0, 0, 1
xinput set-prop $MOUSE_ID "libinput Button Scrolling Button" 2      # This is middle mouse. Already 2 by default

```

## Подсветка монитора: управление из консоли

`ddccontrol -r 0x10 -W +5 dev:/dev/i2c-4`

Хак для nvidia (нужно в модуль ядра компилить):
 https://www.ddcutil.com/nvidia/