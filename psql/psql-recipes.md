Postgresql recipes
==================

## Обязательный вход по паролю

`/etc/postgresql/[VERSION]/main/pg_hba.conf`:

	local   all             postgres                                md5

Везде `md5` вместо `peer`.
Далее рестартнуть сервер:

	sudo service postgresql restart

## Alter ENUM

http://stackoverflow.com/a/7834949/1760643

	ALTER TYPE enum_type ADD VALUE 'new_value'; -- appends to list
	ALTER TYPE enum_type ADD VALUE 'new_value' BEFORE 'old_value';
	ALTER TYPE enum_type ADD VALUE 'new_value' AFTER 'old_value';

## выбор поля из данных JSON

```
CREATE table my_table (
    . . .
    data json
);


SELECT json_extract_path_text(data, 'fieldName') FROM my_table`
```

### Поле даты без часового пояса со значением по умолчанию

```
CREATE table my_table (
    . . .
    "createTime" timestamp without time zone NOT NULL DEFAULT timezone('utc', now()),
);
```

либо `...DEFAULT (now() at time zone 'utc')`
