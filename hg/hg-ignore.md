 Составление файла hg-ignore
=============================

Комментарии
-----------

	#comments

Имена
-----

Глобальное игнорирование файлов с именем, содежащим file-name:

file-name

Расширения
----------

glob БЕЗ пробела!!!
нельзя просто писать ``*.lnk``, нужно писать ``glob:**lnk``
либо так:

	syntax: glob
	*.lnk

есть ещё ``syntax: regexp``
	
Отключение директории только в корне
------------------------------------

регулярные выражения применяются к полным путям файлов

    regexp:^images*

^ - начало строки ("корень" репозитория)
* - любые символы

regexp:^images\\*

фильтровать только то, что в папке, папку не трогать

экранировни слэшей - \\ и \/

`<http://stackoverflow.com/questions/9051190/hg-ignore-directory-at-root-only>`_
`<http://stackoverflow.com/questions/8014556/how-to-replace-backslash-to-forward-slash-in-perl>`_


Использованная литература
-------------------------

`<http://www.selenic.com/mercurial/hgignore.5.html>`_

Примеры
-------

Все файлы из папки, кроме `*.hgdir`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	regexp:^temp/(?!.*\.hgdir$).+

Исключить `*.inc.sh`-файлы из папки `ps/`
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	regexp:^ps/[\w\-_\.]*\.inc\.sh$

Глобальный hgignore
~~~~~~~~~~~~~~~~~~~

	[ui]
	ignore = /path/to/file