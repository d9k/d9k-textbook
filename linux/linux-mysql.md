Установка
---------
sudo apt-get install mysql-server mysql-client

Настройки
---------
 /etc/mysql/my.cnf

Remote access
-------------
В секции [mysqld] файла /etc/mysql/my.cnf дописать:
bind-address    = ***.***.***.***
bind-address = 0.0.0.0 #будет слушать все хосты
sudo /sbin/iptables -A INPUT -i eth0 -p tcp --destination-port 3306 -j ACCEPT
sudo service iptables save
/etc/init.d/iptables restart

$sudo mysql -u root -p
mysql> CREATE USER 'USERNAME'@'%' IDENTIFIED BY 'YOUR_PASSWORD';
mysql> CREATE USER 'USERNAME'@'localhost' IDENTIFIED BY 'YOUR_PASSWORD';

исправление пароля:
mysql>#SET PASSWORD FOR 'webroot'@'%' = PASSWORD('YOUR_PASSWORD');

superadmin privileges:
mysql> GRANT ALL PRIVILEGES ON *.* TO 'webroot'@'%'  WITH GRANT OPTION;

proxy privileges:
mysql> GRANT PROXY ON ''@'' TO 'webroot'@'localhost' WITH GRANT OPTION;

standart user privilages:
mysql> GRANT ALL PRIVILEGES ON DB_NAME.* TO 'USERNAME'@'%';
mysql> GRANT ALL PRIVILEGES ON DB_NAME.* TO 'USERNAME'@'localhost';

показать полномочия
-------------------
show grants for 'USER'@'HOST';

remove privileges
-----------------
mysql> REVOKE ALL PRIVILEGES, GRANT OPTION FROM USERNAME
mysql> REVOKE PROXY ON ''@'' FROM 'USERNAME';

Удалить пользователя
--------------------
mysql> drop user 'USERNAME'@'HOST';

default codepage
----------------
SET NAMES 'utf8'; /*for session*/

my.cnf:

[client]
default-character-set = utf8

[mysqld]

collation-server = utf8_unicode_ci
init-connect = 'SET NAMES utf8'
character-set-server = utf8

# (see http://stackoverflow.com/questions/1036454/what-are-the-diffrences-between-utf8-general-ci-and-utf8-unicode-ci for collation information)

[mysql]
default-character-set = utf8

http://stackoverflow.com/questions/3513773/change-mysql-default-character-set-to-utf8-in-my-cnf

load from file and execute
--------------------------
mysql>source full/path/to/file.sql

mysql query builder
http://sourceforge.net/projects/sqleo/

Стандартный скрипт на увеличение безопасности
---------------------------------------------

sudo mysql_secure_installation
