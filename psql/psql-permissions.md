# PostgreSQL permissions

см. `postgres.md` про первичную настройку `pg_hba.conf`

## Создание пользователя

`$ createuser -U postgres username`

## Изменить пароль

```
	$ psql
	postgres=# \password username
```

## Суперпользователь

`ALTER USER someuser WITH SUPERUSER;`

## Доступ к базе данных для пользователя

`GRANT ALL PRIVILEGES ON DATABASE dbname TO username;`

## Если pg_dump не работает

При возникновении ошибки

```
pg_dump: [archiver (db)] query failed: ERROR:  permission denied for relation users
pg_dump: [archiver (db)] query was: LOCK TABLE public.users IN ACCESS SHARE MODE
```

```
GRANT USAGE ON SCHEMA public TO <user>;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO <user>;
```
