Горячие клавиши bash
====================

	bindkey | grep НУЖНОЕ

Вправо/влево на слово
---------------------
1) alt+f/alt+b (forward/backward)
2) добавить в  ~/.inputrc:

"\eOC": forward-word
"\eOD": backward-word

Ctrl-x Ctrl-r - перезагрузить файл
Теперь Ctrl-Right и Ctrl-Left будут иметь нужную функциональность

http://superuser.com/questions/204746/how-to-move-one-word-right-left-in-linux-bash

Продолжить выполнение текущей команды в фоне
--------------------------------------------

(аналог запуска с `&`)

Отправить `ctrl+Z` а затеп вызвать команду `bg`

[ещё примерчики управления задачами](http://www.thegeekstuff.com/2010/05/unix-background-job/)