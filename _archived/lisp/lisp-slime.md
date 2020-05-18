SLIME
=====

Установка #2
------------

http://www.quicklisp.org/beta/

Hotkeys
-------
last command: Alt-P
prev: Alt-N

Подсветка парной скобки
-----------------------
~/.emacs
(show-paren-mode 1)

контекстная справка
-------------------
ctrl+c ctrl+d d / ctrl+c ctrl+d ctrl+d = slime-describe-symbol

смена папки
-----------
alt-x slime-cd

запуск файла
------------
(load "")

slime-reload
------------

`alt-x` `slime-reload`

	(defun load-slime ()
	  ;; here should be placed all the usual configuration code.
	  ;; like loading contribs and setting variables
	  (slime-setup '(slime-fancy ...)))

	(load-slime)

	(defun slime-reload ()
	  (interactive)
	  (mapc 'load-library
	        (reverse (remove-if-not
	                  (lambda (feature) (string-prefix-p "slime" feature))
	                  (mapcar 'symbol-name features))))
	  (setq slime-protocol-version (slime-changelog-date))

	  (load-slime))

Прерывание
----------

ctrl-c ctrl-c

Во время редактирования файла
-----------------------------

ctrl+c ctrl+c - выполнение выделенной команды

ctrl+c ctrl+k - выполнение всего файла

ctrl+c ctrl-r - выполнение блока кода

ctrl+c ctrl-e - выполнение произвольного кода (ввод строки)