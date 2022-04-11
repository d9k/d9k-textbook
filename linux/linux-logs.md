# Логи в Linux

## syslog пуст

`/var/log/syslog`

попробовать

`sudo chown syslog:adm /var/log/syslog`

http://ubuntuforums.org/showthread.php?t=2116006

## тестовая запись в syslog

## Отладка logrotate

`cat /var/lib/logrotate/status`

https://access.redhat.com/solutions/32831

## log of service

`journalctl -xefu service-name`
