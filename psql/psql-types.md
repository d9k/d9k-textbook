# Типы данных Postgresql

## Добавление/удаление возможных значений в enum

```
ALTER TYPE enum_type ADD VALUE 'new_value'; -- appends to list
ALTER TYPE enum_type ADD VALUE 'new_value' BEFORE 'old_value';
ALTER TYPE enum_type ADD VALUE 'new_value' AFTER 'old_value';
DELETE FROM pg_enum en WHERE en.enumtypid=124 AND en.enumlabel='unique';
```
