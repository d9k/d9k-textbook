# Консольный поиск в linux

## grep - экранирование знака минус

	grep "\-a"
	grep -- -a

## grep в папке

	grep -nr yourString* .

-n: show line numbers
-r: recursive
http://stackoverflow.com/questions/4121803/how-can-i-use-grep-to-find-a-word-inside-a-folder

## anti-grep

	`-v`:

	ls | grep -v ".mp3"

## Поиск файла по имени в папке

	find . -name \*FILENAME\* -print

## Поиск синонимов по жёсткой ссылке

	find /home -xdev -samefile file1

## Поиск файлов по размеру

	du -sm * | sort -n

## Поиск только файлов или только директорий

	find . -type f -exec chmod 0600 {} \;
	find . -type d -exec chmod 0755 {} \;

## Список всех известных исполняемых файлов

bash:

`compgen -c`

## Replace in files

See [linux-cli-text](./linux-cli-text).