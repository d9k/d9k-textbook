Linux cinnamon
==============

Установка cinnamon
------------------

    sudo add-apt-repository ppa:embrosyn/cinnamon

    sudo apt-get update && sudo apt-get install cinnamon

http://www.omgubuntu.co.uk/2016/04/how-to-install-cinnamon-3-0-on-ubuntu

Удаление cinnamon
-----------------

    sudo ppa-purge ppa:embrosyn/cinnamon

Отключение software updater
---------------------------

http://sourcedigit.com/15388-turn-off-disable-update-manager-ubuntu-automatic-updates-in-ubuntu-14-0414-10/


```
dconf write "/com/ubuntu/update-notifier/no-show-notifications" 1
gconftool -s --type bool /apps/update-notifier/auto_launch false
```

software & updates application, "Updates" tab

Dark theme
----------

https://github.com/horst3180/arc-theme

## Edit menu

`cinnamon-menu-editor`

## Run .desktop file

`exo-open file.destop`

(`exo-utils` required)
