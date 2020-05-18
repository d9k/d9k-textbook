Emacs
=====

Термины
-------
Буферы (buffers) - открыты файлы
Окна (windows) - область экрана

tabs count
----------
~/.emacs:

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

http://stackoverflow.com/questions/69934/set-4-space-indent-in-emacs-in-text-mode

cancel partially typed command
------------------------------
ctrl+]
ctrl+g

auto mode
---------
(setq auto-mode-alist (cons '(".*\.gcf$" . YOUR-MODE) auto-mode-alist))

.el scripts common path
-----------------------
/usr/share/emacsXX/site-lisp

ini mode default
----------------

http://www.emacswiki.org/emacs/any-ini-mode.el

line numbers: linum
-------------------

~/.emacs: 

(require 'linum)
(setq linum-format "%4d \u2502 ")

linum.el to /usr/share/emacs23/site-lisp

http://www.logic.at/prolog/linum/linum.html
http://www.emacswiki.org/emacs/LineNumbers

always:
http://ergoemacs.org/emacs/emacs-tip_mode_on_off_toggle.html
(global-linum-mode 1)

php highlight
-------------
(require 'php-mode-improved)
http://stackoverflow.com/questions/2692542/php-syntax-highlighter-for-emacs
http://www.emacswiki.org/emacs/PhpMode

http://www.emacswiki.org/emacs/php-mode-improved.el
$ wget http://www.emacswiki.org/emacs/download/php-mode-improved.el
$ mv php-mode-improved.el php-mode.el
$ emacs ~/.emacs
(require 'php-mode)

(rename to php-mode.el)


search
------
C-s forward
C-r backward
http://www.gnu.org/software/emacs/manual/html_node/emacs/Incremental-Search.html

reread file
-----------
M-x revert-buffer RET yes RET
C-x C-v RET

http://www.emacswiki.org/emacs/RevertBuffer

tab doesn't work
----------------
C-q C-i

Отключить строку меню
---------------------
(menu-bar-mode -99)

windows
-------
Окна - неперекрывающиеся области экрана, отображающие состояние буферов
ctrl+x 2 - вертикальное разделение (alt+x split-window-vertically)
ctrl+x 3 | ctrl+x 5 - горизонтальное разделение (alt-x split-window-horizontally)
Ctrl+x o - переход на другое окно
ctrl+x 0 - закрыть окно
ctrl-x ^ - расширить окно по вертикали
ctrl-x } / ctrl-x { - расширить/сузить окно по горизонтали

Открыть папку с файлами
-----------------------
(где текущий файл) - `ctrl+X D` - называется dired
g - обновить список
s (sort) - сортировка по дате/имени

больше:
http://www.gnu.org/software/emacs/manual/html_node/emacs/Dired.html

Справочные материалы
--------------------
ctrl+h ? - справка о справке

Открыть директорию для обзора
-----------------------------
ctrl-x d

Заменить ^M в конце строк
-------------------------
alt+X -> set-buffer-file-coding-system -> return -> mac/dos/unix
http://superuser.com/questions/216373/why-does-emacs-insert-m-at-the-end-of-every-line

сохранить файл
--------------
под тем же именем: `ctrl-x ctrl-s`
под кастомным имененм: `ctrl-x ctrl-w`

переименовать файл
------------------
http://stackoverflow.com/questions/384284/how-do-i-rename-an-open-file-in-emacs


Буферы
------

Буферы - эоткрытые файлы, необязательно видимые (могут не иметь окна для вывода и висеть в фоне)

Буферы - открытые файлы (могут не иметь окна для вывода и висеть в фоне)
Показать буферы: C-x X-b

Закрыть буфер
~~~~~~~~~~~~~

C-x k bufname <RET>
    Kill buffer bufname (kill-buffer).
M-x kill-some-buffers
    Offer to kill each buffer, one by one.
M-x kill-matching-buffers
    Offer to kill all buffers matching a regular expression. 

Открыть буфер в текущем окне
~~~~~~~~~~~~~~~~~~~~~~~~~~~~

	switch-to-buffer buffer-or-name &optional norecord force-same-window

Запуск shell-команды
--------------------

`alt+!` (`alt-shift-1`)