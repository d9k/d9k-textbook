# Рецепты пакетного менеджера aptitude

## Обновить пакеты

sudo apt-get upgrade

## Обновить только некоторые пакеты

sudo apt-get --only-upgrade install [packages names]

## Искать пакет

apt-cache search php5

## Проблемы с MIME-типами

При установке пакета следующее предупреждение

	Processing triggers for shared-mime-info...
	...
	Unknown media type in type 'uri/rtspt'
	Unknown media type in type 'uri/rtspu'
	...

лечить:

	cd /usr/share/mime/packages/
	sudo mv kde.xml kde.xml.bk
	sudo update-mime-database /usr/share/mime

[вопрос на askubuntu](http://askubuntu.com/questions/39852/how-to-remove-warnings-like-unknown-media-type)

## нет команды add-apt-repository

sudo apt-get install software-properties-common
sudo apt-get install python3-software-properties
sudo apt-get install python-software-properties

## returned error

    sudo apt-get --force-yes install <pkgname>
    sudo apt-get --force-yes remove <pkgname>

http://askubuntu.com/questions/438345/how-to-remove-install-a-package-that-is-not-fully-installed

## dpkg remove

  sudo dpkg -r <pkgname>
  sudo dpkg -P <pkgname>

## public key not available

`W: Failed to fetch http://ppa.launchpad.net/embrosyn/cinnamon/ubuntu/dists/xenial/InRelease  The following signatures couldn't be verified because the public key is not available: NO_PUBKEY EA1FE56966DFE684`

скопировать хэш в конце ошибки в команду

`sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com [хэш]`

## Проблемы установки Linux и пакетов

Проблема:

    % sudo apt-get -f install
    . . . . .
    Preparing to unpack .../accountsservice_0.6.40-2ubuntu11.3_amd64.deb ...
    Failed to stop accounts-daemon.service: Unit accounts-daemon.service not loaded.
    dpkg: warning: subprocess old pre-removal script returned error exit status 5
    dpkg: trying script from the new package instead ...
    Failed to stop accounts-daemon.service: Unit accounts-daemon.service not loaded.
    dpkg: error processing archive /var/cache/apt/archives/accountsservice_0.6.40-2ubuntu11.3_amd64.deb (--unpack):
    subprocess new pre-removal script returned error exit status 5
    /usr/bin/deb-systemd-helper: error: unable to read accounts-daemon.service
    Failed to get unit file state for accounts-daemon.service: No such file or directory
    accounts-daemon.service is a disabled or a static unit, not starting it.
    Errors were encountered while processing:
    /var/cache/apt/archives/accountsservice_0.6.40-2ubuntu11.3_amd64.deb
    E: Sub-process /usr/bin/dpkg returned an error code (1)

`sudo rm /var/lib/dpkg/info/accountsservice.prerm` перед установкой (ну и бэкап на всякий случай)

## dpkg: unmet dependancies

`sudo apt-get -f install` после этого

## Установить старую версию пакета

Найти пакет тут

http://www.ubuntuupdates.org/package_metas/alphabetical

и скачать все его зависимости.

Поставить через `sudo dpkg -i <package_name>`


## Зависимости пакета

`apt-cache depends python`

## Зависимые пакеты

`apt-cache rdepends packagename`

## Информация о пакете

`apt-cache show <package_name>`

## Не обновлять пакет

```
sudo apt-mark hold <package_name>
apt-mark showhold
```

## Установленные пакеты

`dpkg --get-selections | grep -v deinstall`

## Уменьшить timeout ожидания сервера при apt update

создайте /etc/apt/apt.conf.d/99timeout :

```
Acquire::http::Timeout "10";
Acquire::ftp::Timeout "10";
```

https://askubuntu.com/questions/141513/how-to-lower-wait-time-for-repository-updates

Установленная версия пакета (с каких ppa)

```
apt-cache policy package_name
apt-cache madison package_name
```

## Файлы пакета

`dpkg-query -L package_name`

## Какому пакету принадлежит файл

`dpkg --search /path/to/file`

## Возможные Версии пакета

(с разных ppa)

`apt-cache policy firefox`

## Изменение ppa по-умолчанию для пакета

https://askubuntu.com/questions/293619/assign-higher-priority-to-ppa

https://askubuntu.com/questions/293619/assign-higher-priority-to-ppa

# Поиск файла

```
sudo apt install apt-file
sudo apt update
apt-file search "gl.h"
```

# Upstart: list services

autostart:

`systemctl list-unit-files --type=service`

status:

`systemctl list-units --type=service`

# Поиск версии библиотеки

`sudo ldconfig -v | grep libmtp`

# Истекшие ключи репозиториев

`sudo apt-key list | grep -B 1 -A 1 expired`

# gpg: keyserver receive failed: Server indicated a failure

запустить вручную, убрать протокол и порт у `keyserver`:

`sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 08C36551`

# Unable to acquire the dpkg lock /var/lib/dpkg/lock

```
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock
sudo rm /var/lib/dpkg/lock-frontend

sudo dpkg --configure -a
```

https://pingvinus.ru/note/dpkg-lock
