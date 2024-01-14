Postgresql
==========

## Установка

```
$ sudo apt-get install postgresql postgresql-contrib postgresql-client
$ sudo -u postgres psql postgres
\password postgres
CREATE EXTENSION adminpack;
\q
```

`/etc/postgresql/9.3/main/pg_hba.conf`:

```
......
# TYPE DATABASE USER ADDRESS METHOD
local  all     all          md5
local  all     postgres     peer
```

далее

```
$ sudo service postgresql restart
$ psql postgres postgres
```

добавление пользователя

```
$ createuser -U postgres username
$ psql postgres postgres
\password dbuser
```


## Создание БД

```
$ sudo -u postgres create
$ sudo -u postgres createuser username
$ sudo -u postgres createdb dbname
$ sudo -u postgres psql postgres
\q
```

(При md5-авторизации:

`$ createdb -U postgres dbname`

)


https://help.ubuntu.com/community/PostgreSQL

## Подключение через админский аккаунт


```
% sudo -i -u postgres
$ psql
```

## Перезапуск сервера

`/etc/init.d/postgresql reload`

## Удаление пользователя и базы данных

```
su -l postgres
dropdb zotonic
dropuser zotonic
```

## Чтобы в БД можно было заходить с удалённого сервера

(по `psql -h <ip> -U postgres -d postgres`, например)

`/etc/postgresql/9.3/main/postgresql.conf`:

```
listen_addresses='*'
```

`/etc/postgresql/9.1/main/pg_hba.conf`:

```
host    all             all             0.0.0.0/0            md5
```

then

```
% sudo service postgres reload
```
## Подключение к базе по паролю

в `pg_hba.conf`:

(`# TYPE DATABASE USER ADDRESS METHOD`)

`local  all     all                   md5` должно идти ПЕРВОЙ строкой

команда на подключение:

`psql -U username --password db_name`

## Ссылки

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04
