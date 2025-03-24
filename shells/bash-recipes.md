Рецепты bash
============

## Прочитать строку предложив её часть для изменения

    $ read -re -p 'Edit> ' -i '/home/user1/bla/bla/foo/bar/bar/dir1/dir2/filename.xyz' filename
    $ echo "You entered: $filename"

https://stackoverflow.com/questions/28033566/bash-prompt-user-to-edit-string-and-enter#28033719

## Найти лог-файлы

ps aux | grep php-fpm, then do lsof -p $PID | grep log

## Если завис терминал

`Enter` `~` `.`


## Если глючит

reset

## алиас на открытие в фоновом процессе

.bashrc:

	e() { emacs "$@" & }

in bash:

	e foo.txt

[Unix SE: alias-a-command-to-run-in-the-background](http://unix.stackexchange.com/questions/21307/alias-a-command-to-run-in-the-background)

## Запустить приложение со всеми переданыыми параметрами

executable-name "$@"

http://stackoverflow.com/questions/3811345/how-to-pass-all-arguments-passed-to-my-bash-script-to-a-function-of-mine

## Пересканировать $PATH

## Восстанавливать папку на выходе


`~/.bash_logout` и `~/.zlogout`(не работает):

	pwd > ~/.lastdirectory

в конец `~/.bashrc` и `~/.zshrc`:

	[ -s ~/.lastdirectory ] && cd `cat ~/.lastdirectory`

в конец `~/.zshrc`:

    TRAPEXIT() {
        pwd > ~/.lastdirectory
    }

http://stackoverflow.com/a/767130/1760643

## Проверка графического режима

	if [ "$DISPLAY" ] || [ "$WAYLAND_DISPLAY" ] || [ "$MIR_SOCKET" ]; then
		...
	fi

## Вывод цветного текста

	#0-черный; 1 - красный, 2 - зелёный, 3 - жёлтый, 4 - синий, 5 - фиолетовый, 6 - голубой, 7 - серый
	tput setaf 1; echo "this is red text";
	#очистить (белый)
	tput sgr0

## Передать все параметры другому скрипту

	script-to-run "$@"

## Автоматически вызывать действие по изменению файла

Установка when-changed:

	sudo pip install when-changed
	sudo apt-get install inotify-tools inotify-hookable

Вызов when-changed:

	when-changed $MYSITE/less/*.less -c "bash ~/scripts/mysite-compile-less.sh"

## Скопировать случайные файлы

	find . | shuf -n 10 | sed "s/'/\\\'/" | xargs -I{} cp {} /path/to/player


## Удалить файлы нулевого размера

	find . -size 0 -delete


## Скопировать файлы из одной папки в другую

	cp -R t1/. t2/

http://stackoverflow.com/a/4645159/1760643

## Парсинг аргументов

http://stackoverflow.com/questions/192249/how-do-i-parse-command-line-arguments-in-bas

## Вывод в STDERR

	alias echoerr='>&2 echo'
	echoerr Hello Error

http://stackoverflow.com/questions/2990414/echo-that-outputs-to-stderr


## get error output

	TMP=$(mktemp)
	var=$(myscript.sh 2> "$TMP")
	err=$(cat "$TMP")
	rm "$TMP"

from http://stackoverflow.com/a/13806732/1760643

## Проверить графическую оболочку

    desktop_env=$(echo "$XDG_DATA_DIRS" | sed 's/.*\(xfce\|kde\|gnome\).*/\1/')
