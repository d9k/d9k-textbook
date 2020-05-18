Network Manager не управляет соединениями:
------------------------------------------

В /etc/NetworkManager/NetworkManager.conf прописать в секции [ifupdown]:
managed=true
Перезагрузиться (или перезапустить NetworkManager - как - не знаю)

sudo-запуск графического приложения
-----------------------------------
gksudo gedit&

Аппаратное ускорение flash
--------------------------
/etc/adobe/mms.cfg 
EnableLinuxHWVideoDecode=1
OverrideGPUValidation=1
http://ubuntugenius.wordpress.com/tag/enablelinuxhwvideodecode-1/

Очистка dns
-----------
sudo apt-get install nscd

sudo /etc/init.d/nscd restart
sudo /etc/init.d/networking restar
sudo /etc/init.d/dns-clean start
http://www.netopalto.ru/kak-sbrosit-dns-kesh-v-ubuntu-12.04.html

${username} is not in the sudoers file.  This incident will be reported
-----------------------------------------------------------------------
su
usermod -aG sudo ${username}

free space
----------
df -lhT

Автозагрузка
------------
Alt+F2 -> gnome-session-properties
xfce4-autostart-editor
~/.config/autostart

Размер xfce4-terminal по-умолчанию
----------------------------------
/home/d9k/.config/Terminal/terminalrc
MiscDefaultGeometry=100x50+220+70
(100x50 symbols
shift 220;70 pixels)

Очистить строку ввода команды в консоли
---------------------------------------
ctrl+U



Быстрый функциональный alt-f2
-----------------------------
xfce4-appfinder --disable-server
sudo apt-get install gmrun