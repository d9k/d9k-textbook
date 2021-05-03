Изменение файлов с помощью bash
===============================

## Дозаписать в начало файла
	echo -e "task goes here\n$(cat todo.txt)" > todo.txt

http://superuser.com/questions/246837/how-do-i-add-text-to-the-beginning-of-a-file-in-bash


## Массовое переименование

Пример: заменить в именах файлов `_` на `-`.

`rename 's/_/-/g' * -vn` - `-n` - тестовый запуск, без изменений. Дальше запустить без ключа `n` на конце

## Удалить имя исполнителя из файла

(удалить до `-`)

`rename -v -n 's/.*- +//' *.mp3`, потом запустить без `-n`

## Конвертирование из кодировки windows

    iconv -f cp1251 -t utf8 readme.txt > readme_utf.txt

## Цветное сравнение файлов

    sudo apt-get install colordiff`

## Получение расширения и имени файла

```
    FILE_NAME=`basename "$FILE_PATH"` # имя с расширением
    EXTENSION=`echo "$FILE_NAME" | cut -d'.' -f2-`
```
https://stackoverflow.com/a/12353027/1760643

```
    extension=${file_path#*.}
    name=${file_path%*.$extension}
```
## Получение папки файла

  `dir_path=$(basename "$FILE")`

## Удалить все кроме

find . | grep -v ".gitignore" | sudo xargs rm -r

## Скопировать все кроме

`cp -r $(ls -A | grep -v "node_modules") ~/my-backup`

`rsync -a --exclude 'node_modules' from to` - `node_modules` будет любой папкой в пути

```
# rsync -a explanation:
#
# -a, --archive:            archive mode; equals -rlptgoD (no -H,-A,-X)
#   -r, --recursive
#   -l, --links                 copy symlinks as symlinks
#   -p, --perms                 preserve permissions
#   -t, --times                 preserve modification times
#   -g, --group                 preserve group
#   -o, --owner                 preserve owner (super-user only)
#   -D                          same as --devices --specials
#     --devices                 preserve device files (super-user only)
#     --specials                preserve special files
#
#  BUT NO:
#   -H, --hard-links            preserve hard links
#   -A, --acls                  preserve ACLs (implies -p)
#   -X, --xattrs                preserve extended attributes
```

## Скопировать с созданием директорий относительного пути

`cp --parents relative/path/to/file /target`

в `target` создадутся папки `relative/path/to`
