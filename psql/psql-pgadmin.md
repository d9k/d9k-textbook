pgadmin
=======

## Удалить все таблицы в базе данных через pgadmin

`ПКМ по ним -> drop cascaded`

## pgadmin4 через docker

`docker run --rm -p 5050:5050 thajeztah/pgadmin4` (можно дополнительно `-v=some/local/path:/pgadmin` (ДО имени образа) для сохранения настроек между запусками)

`ifconfig -a`, посмотреть ip хоста, связанный с виртуальной сетью `docker0`, например `172.17.0.1` (этот ip надо будет использовать и в web-интерфейсе pgadmin4 для соединеиня).

Тогда добавить в `/etc/postgresql/9.5/main/pg_hba.conf` (сделать бэкап конфига!):

`host all all 172.17.0.0/0 md5` (md5 - это использование паролей для доступа)

В `/etc/postgresql/9.5/main/postgresql.conf` (сделать бэкап конфига!)

`listen_addresses = '*'`

Перезагрузить postgresql `sudo service postgresql restart`, проверить обычный доступ и доступ с web-интерфейса pgadmin4

`ifconfig -a` - ip хоста для подключения из docker-контейнера

## настройка доменного имени

    upstream pgadmin_docker{
        server 0.0.0.0:5050;
    }

    server {
        listen 80;
        server_name pgadmin;
        location / {
            proxy_pass http://pgadmin_docker;
        }
    }

и в /etc/hosts не забыть добавить

### см. также

https://hub.docker.com/search/?isAutomated=0&isOfficial=0&page=1&pullCount=0&q=pgadmin&starCount=0
https://github.com/fenglc/dockercloud-pgAdmin4 - popular, no persistent data?!
https://github.com/thaJeztah/pgadmin4-docker
