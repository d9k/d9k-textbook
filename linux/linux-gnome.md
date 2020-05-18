Перезагрузка окружения
----------------------
alt+F2 -> r [Enter]

Смена сочетаний клавиш
----------------------
System Tools -> System Settings -> Keyboard

tweak tool
-----------
sudo add-apt-repository ppa:tualatrix/ppa
sudo apt-fast update
sudo apt-fast install ubuntu-tweak
sudo apt-fast install unity-tweak-tool
sudo apt-fast install gnome-tweak-tool

shell extensions
----------------
sudo apt-get install gnome-shell-extensions
sudo apt-fast install gnome-tweak-tool
gnome-tweak-tool [-> shell extensions]

https://extensions.gnome.org/
* frippery bottom panel
* frippery panel favourites
* frippery move clock

Клавиши
-------
Alt+F1 - открывает меню Приложений
Alt+F2 - отображает диалог Запуск приложения
Print Screen - делает скриншот всего рабочего стола
Alt+Print Screen - делает скриншот текущего окна
Ctrl+Alt+Стрелки - переключается в указанном направлении по текущему рабочему пространству
Ctrl+Alt+D - минимизирует все окна и делает фокус на десктопе
Ctrl+Alt+Tab - переключение внимания между панелями и рабочим столом. Список пунктов, которые вы можете выбрать, отображается. Отпустите клавиши для выбора пункта. Вы можете нажать клавишу Shift, чтобы пройти через элементы в обратном порядке
Alt+F4 - закрывает текущее окно
Alt+F5 - уменьшает текущее окно, если оно максимизировано
Alt+F7 - перемещение текущего окна. После нажатия этого сочетания клавиш, вы можете двигать окно, используя мышь или клавиши стрелочек. Чтобы закончить движение, кликните мышкой или нажмите любую клавишу на клавиатуре
Alt+F8 - изменяет размер текущего окна. После нажатия этих клавиш, вы можете изменять размер окна, используя мышь или клавиши стрелочки. Чтобы закончить изменение размера, кликните мышкой или нажмите любую клавишу на клавиатуре
Alt+F9 - минимизирует текущее окно
Alt+F10 - максимизирует текущее окно
Alt+пробел - открывает меню для текущего выбранного окна. Меню окна позволяет вам выполнять такие действия на окне, как минимизация, перемещение между рабочими областями, закрытие.
Shift+Ctrl+Alt+Стрелки - перемещает текущее окно в другую рабочую область в заданном направлении
F10 - активирует крайнее слева меню окна приложения
Shift+F10 - активирует контекстное меню для выбранного элемента

Редактирование элементов меню
-----------------------------
https://apps.ubuntu.com/cat/applications/alacarte/

fixed workspaces
----------------
gnome-tweak-tool
disable "Dynamic workspaces"

select window
-------------
	wmctrl -a "TITLE PART"

select window or run else
-------------------------
	#!/bin/bash                                                                                                                    
	name="Sublime Text 2"

	t=$(wmctrl -lp | grep "${name}")
	if [ $? -eq 1 ]; then
	    sublime-text &
	else
	    wmctrl -a "${name}"
	fi


автоматическое закрепление окон за рабочим столом
-------------------------------------------------
gdevilspie

error: 'module' object has no attribute 'xdg_config_home'
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
( 1 ) Open a terminal with ctrl + alt + t
( 2 ) Type sudo gedit /usr/bin/gdevilspie and press enter
( 3 ) Enter your password and press enter
( 4 ) If you do not see line numbers, click the edit menu in gedit, then click preferences ( look for the check box "show line numbers" and check it
( 5 ) Scroll down to line 374 and put a # symbol to the far left of the line ( prefix the line with # )
( 6 ) Press ctrl + s to save the changes and then exit out of gedit ( maybe give it a few seconds to finish saving before exiting though )

gnome: горячие клавиши с клавишей windows не работают
-----------------------------------------------------
predefined:
org/gnome/settings-daemon/plugins/media-keys
custom:
org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0
Change <Super> to <Mod4> in shortcuts [NOT WORKING]

In gnome3, run "Keyboard" under Settings. Then click "Layout Settings" (link at the bottom). Then click the options button. Then expand the + for Alt/Win key behavior" and change the setting to "Hyper is mapped to Win-Keys". This does prevent having to type the shortcut key twice, but prevents the Super key from bringing up the overview (like clicking Activities).

http://superuser.com/questions/415675/gnome-shell-3-4-and-a-super-key-related-shortcut

