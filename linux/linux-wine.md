Wine
====


Ubuntu icons glitch
-------------------
.desktop:

StartupWMClass=application.exe
where application.exe is the base name of the executable you want to launch in Wine.


http://askubuntu.com/questions/39394/change-icon-of-wine-application-in-unity-launcher


wine gnome-keyring-pkcs11
-------------------------
/usr/lib/i386-linux-gnu/pkcs11/gnome-keyring-pkcs11.so: /usr/lib/i386-linux-gnu/pkcs11/gnome-keyring-pkcs11.so: cannot open shared object file: No such file or directory

http://www.techspotde.com/wine-cant-find-gnome-keyring-pkcs11-so/

create desktop icon
-------------------

WLCreator (Windows Launcher creator) is a Python program (script) that creates Linux desktop launchers for Windows programs (using Wine). 

http://www.ubuntugeek.com/wl-creator-creates-linux-desktop-launchers-for-windows-programs.html
https://code.google.com/archive/p/wine-launcher-creator/downloads

Disable gamepad
---------------

(when using antimicro)

https://github.com/Ryochan7/antimicro/wiki/Methods-for-Disabling-Joystick-Reading-in-Linux

Black steam store pages
-----------------------

add `-no-cef-sandbox` param

https://www.reddit.com/r/wine_gaming/comments/3vuuu9/steam_store_cant_connect_giving_me_black_screen/