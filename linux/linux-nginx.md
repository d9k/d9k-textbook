Отключить автозапуск apache
---------------------------
$sudo update-rc.d -f apache2 remove
$sudo /etc/init.d/apache2 stop

Установка на debian
-------------------
добавить в /etc/apt/sources.list:
для debian 7:
	deb packages.dotdeb.org stable all
	deb-src packages.dotdeb.org stable all

для debian 6:
	deb packages.dotdeb.org squeeze all
	deb-src packages.dotdeb.org squeeze all

установить pgp ключ

$wget www.dotdeb.org/dotdeb.gpg
$cat dotdeb.gpg | sudo apt-key add -

$sudo apt-get install php5-cgi
$sudo apt-get install php5-fpm
$sudo apt-get install nginx

http://habrahabr.ru/qa/12031/

Папка с сайтов по-умолчанию
---------------------------
сайт - /usr/share/nginx/html | /usr/share/nginx/www
конфиг - /etc/nginx/sites-available/default

Конфиг
------
главный: sudo nginx -t

/etc/nginx/nginx.conf

по-умолчанию подключаются
include /etc/nginx/conf.d/*.conf;
include /etc/nginx/sites-enabled/*;

Запуск
------
$sudo /etc/init.d/php5-fpm start 
$sudo /etc/init.d/nginx start 


php5-fpm
--------
http://habrahabr.ru/post/113101/

$sudo nano /etc/php5/fpm/php.ini
cgi.fix_pathinfo = 0;

$sudo nano /etc/php5/fpm/pool.d/www.conf
security.limit_extensions = .php .php3 .php4 .php5
listen = /var/run/php5-fpm.sock

http://help.ubuntu.ru/wiki/nginx-phpfpm

php-fpm reached max children:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
/etc/php-fpm.d/www.conf:
	pm.max_requests = 500
http://serverfault.com/questions/479443/php5-fpm-server-reached-pm-max-children

Размещение конфигов сайтов 
--------------------------
/etc/nginx/sites-available - конфиги
/etc/nginx/sites-enabled - символические ссылки на включенные конфиги
 ln -s /etc/apache2/sites-available/example.com /etc/apache2/sites-enabled/example.com

hash bucket size error
----------------------
в секции http nginx.conf :
server_names_hash_max_size 64;
server_names_hash_bucket_size 64;

http://nginx.org/ru/docs/http/ngx_http_core_module.html#server_names_hash_bucket_size

кодирока
--------
charset UTF-8;
source_charset  UTF-8;
#именно через дефис!

wordpress
---------
http://codex.wordpress.org/Nginx
display php errors
------------------
http://stackoverflow.com/questions/8677493/php-fpm-doesnt-write-to-error-log

Отключение заголовка X-Powered-By
---------------------------------

php.ini:

	expose_php=Off 

или
nginx: http|server|location: 

	proxy_hide_header X-Powered-By;

Отключить заголовок сервера:
	proxy_hide_header Server;

http://stackoverflow.com/questions/962230/hide-x-powered-by-nginx