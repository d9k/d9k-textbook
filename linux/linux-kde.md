Linux KDE recipes
=================

Конфликт kubuntu 14.04 с mysql-5.6
----------------------------------

Перед установкой mysql

    sudo add-apt-repository ppa:kubuntu-ppa/backports
    sudo apt-get update

Если придётся переустановить оболочку:

    sudo apt-get install kde-standard kubuntu-desktop

Ускорить KDE
------------

Отключить balooo
~~~~~~~~~~~~~~~~

`$HOME/.kde/share/config/baloofilerc`:

	Indexing-Enabled=false

`~/.config/akonadi/akonadiserverrc`:

	StartServer=false

Автозапуск
----------

`System Settings->System Administration->Startup and Shutdown->Autostart`

fix locale
----------

setlocale.sh:

	export LANG=en_US.UTF-8
	export LANGUAGE=en:ru:en
	export LC_NUMERIC=en_US.UTF-8
	export LC_TIME=en_US.UTF-8
	export LC_MONETARY=en_US.UTF-8
	export LC_PAPER=en_US.UTF-8
	export LC_IDENTIFICATION=en_US.UTF-8
	export LC_NAME=en_US.UTF-8
	export LC_ADDRESS=en_US.UTF-8
	export LC_TELEPHONE=en_US.UTF-8
	export LC_MEASUREMENT=en_US.UTF-8

(TODO: generate locale manual)

kubuntu 14.04 Изменить фон на lock screen
-----------------------------------------

	/usr/share/wallpapers/Elarun/contents/images/

collect debug data
------------------

bustle

https://bugs.launchpad.net/ubuntu/+source/kubuntu-driver-manager/+bug/1280310