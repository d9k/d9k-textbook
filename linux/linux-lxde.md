$sudo apt-get install lxde
$sudo setxkbmap -option grp:switch,grp:ctrl_shirt_toggle us,ru
в файл /etc/xdg/lxsession/LXDE/autostart добавить 
@setxkbmap -option grp:switch,grp:ctrl_shift_toggle,grp_led:scroll us,ru

https://wiki.debian.org/ru/LXDE/

wicd network manager
--------------------