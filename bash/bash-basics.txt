Основы bash
===========

Установка переменной
--------------------

a=1

Экранирование переменной
------------------------

${foo}
${lst[0]}

Режим отладки
-------------

set -v #enable command output
set +v
set -o verbose
set +o verbose
#!/bin/bash -x

Проверка строк на равенство
---------------------------

[bash_check.md](bash_check.md)

Проверка чисел на равенство/неравенство
---------------------------------------

[bash_check.md](bash_check.md)

Проверка количества входных аргументов
--------------------------------------

[bash_check.md](bash_check.md)

Прочитать ввод в переменную
---------------------------

	read var1
	echo var1=$var1
read
-s для паролей (не отображать ввод на экране)
-p ввод с этой же линии (не с новой)
	read -p "var1:" var1
	echo var1=$var1
http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_08_02.html

Запрос на "продолжить дальше"
-----------------------------

read -p "Press [Enter] to import \"$file_to_import\" or [ctrl]+[c] to exit "

Команда на несколько строк
--------------------------

ls \
-l

Переменная на несколько строк
-----------------------------

#!/usr/bin/env bash

read -r -d '' var1 <<EOF
test1
test2 test3
test4

test5
EOF

echo "$var1"

http://stackoverflow.com/questions/1167746/how-to-assign-a-heredoc-value-to-a-variable-in-bash

Конкатенация строк
------------------

a="test"
a=$a" test2"

b="test3"
b+="test4"

Полезные статьи
---------------

More advanced if usage
http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_02.html

Проверка строки на пустоту
--------------------------

[bash_check.md](bash_check.md)

Путь к папке со скриптом
------------------------

	DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

Достать n-ю строку
------------------

	... | awk NR==n

Достать 1-ю строку
------------------

	... | tail -1

## Что означает аргумент "-"

In Unix-like operating systems, a single hyphen-minus by itself is usually a special value specifying that a program should handle data coming from the standard input or send data to the standard output.
