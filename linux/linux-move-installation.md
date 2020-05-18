Копирование установки
=====================

Конфиги
-------

Более всего конфигов хранится в следующих папках:

	/etc
	/home/user

Узнать установленные вручную пакеты
------------------------------------

	comm -13 \
	  <(gzip -dc /var/log/installer/initial-status.gz | sed -n 's/^Package: //p' | sort) \
	  <(comm -23 \
	    <(dpkg-query -W -f='${Package}\n' | sed 1d | sort) \
	    <(apt-mark showauto | sort) \
	  ) > user-installed-packages

http://superuser.com/a/371691/31155