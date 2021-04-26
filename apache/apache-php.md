# Apache: php

## cgi

`sudo a2enmod actions`


```
<Directory "/usr/bin">
  Options ExecCGI
</Directory>

AddType application/x-httpd-php7 .php .php4
#ScriptAlias /php7.3-cgi /usr/lib/cgi-bin/php7.3
ScriptAlias /php7.3-cgi /usr/bin/php-cgi7.3
Action application/x-httpd-php7 /php7.3-cgi
#Action application/x-httpd-php7 /usr/lib/cgi-bin/php7.3
```

https://httpd.apache.org/docs/2.4/mod/mod_actions.html
http://www.softtime.ru/forum/read.php?id_forum=5&id_theme=56054
