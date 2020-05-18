ls
==

вывести только имена файлов в ls
--------------------------------

	ls /some/path/*txt | xargs -n1 basename

http://www.linuxquestions.org/questions/linux-general-1/ls-do-not-list-full-path-only-filename-657894/

Вывести только скрытые файлы
----------------------------

	ls -d .*

http://unix.stackexchange.com/a/21665/48167

Вывести только папки
--------------------

`echo */` или `ls -d */`

http://stackoverflow.com/questions/14352290/listing-only-directory-using-ls-in-bash