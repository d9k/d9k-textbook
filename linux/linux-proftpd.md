start/stop
----------
sudo /etc/init.d/proftpd start
sudo /etc/init.d/proftpd stop
sudo /etc/init.d/proftpd restart

Проверка синтаксиса конфигурационных файлов
-------------------------------------------
sudo proftpd -t -d5 
sudo /etc/init.d/proftpd check-config

Конфиг proftd
-------------
/etc/proftpd/proftpd.conf 

Port                21
RootLogin		off
#777 - 022 = 755
Umask               755 022

туториалы по proftpd
--------------------
http://www.debian-administration.org/articles/228
+ http://www.linuxspace.org/archives/4212
http://www.proftpd.org/
http://www.adm-blog.ru/view/ustanovka_i_nastrojka_proftpd_na_debian.html


mod_auth_file
-------------
http://www.proftpd.org/docs/modules/mod_auth_file.html
http://www.proftpd.org/docs/howto/VirtualUsers.multiple

gen ftp password file
---------------------
http://www.proftpd.org/docs/contrib/ftpasswd.html

запретить анонимный доступ
---------------------------
Удалить все секции <Anonymous>

restrict to home directory
--------------------------
DefaultRoot        ~ !d9k

slow upload
-----------
IdentLookups off
UseReverseDNS off

Полезные директивы
------------------
	<Directory />
	    HideNoAccess on
	</Directory>

	<Directory /home/>
	    GroupOwner www-data
	    <Limit SITE_CHMOD>
	        AllowAll
	    </Limit>
	</Directory>

Virtual users
-------------
AuthUserFile <path> (аналог /etc/passwd)
Format: `username:password:uid:gid:gecos:homedir:shell`
Example: `d9k:x:1000:1000::/home/d9k:/usr/bin/zsh`

`passwd --hash` для генерации хэша

AuthGroupFile <path> (аналог /etc/groups)
Format: `groupname:grouppasswd:gid:member1,member2,...memberN`
Example: www-data:x:33:d9k,leonid

RequireValidShell off
http://blog.supportpro.com/2012/09/virtual-ftp-user-setup-via-proftpd/