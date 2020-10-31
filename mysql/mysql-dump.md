# MySQL Dump

## Пример

`--single-transaction`: консистентное состояние

```
mysqldump -u${DB_USER} -P${DB_PORT} -p${DB_PASSWORD} -h${DB_HOST} \
		--single-transaction \
		--hex-blob \
    ${DB_NAME} -r ${BACKUP_SQL_FILE_NAME}

```

## Пример с репликацией

```
mysqldump -u${DB_USER} -P${DB_PORT} -p${DB_PASSWORD} -h${DB_HOST} \
		--single-transaction \
		--master-data=2 \
		--flush-logs \
		--hex-blob \
    ${DB_NAME} -r ${BACKUP_SQL_FILE_NAME}
```

## Восстановление из бэкапа;

`mysql --show-warnings ...`

`source abs/path/to/dump.sql`
