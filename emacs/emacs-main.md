Emacs
=====

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

buffers
-------

Буферы - открытые файлы (могут не иметь окна для вывода и висеть в фоне)
Показать буферы: C-x C-b
C-x [<-/->] - переключение буферов
C-x k - закрыть буффер (kill)

`Alt-X` `buffer-menu`

`d`/`u`/`s`/`x`

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

Сочетания клавиш в русской раскдадке
------------------------------------

  (defun reverse-input-method (input-method)
    "Build the reverse mapping of single letters from INPUT-METHOD."
    (interactive
     (list (read-input-method-name "Use input method (default current): ")))
    (if (and input-method (symbolp input-method))
        (setq input-method (symbol-name input-method)))
    (let ((current current-input-method)
          (modifiers '(nil (control) (meta) (control meta))))
      (when input-method
        (activate-input-method input-method))
      (when (and current-input-method quail-keyboard-layout)
        (dolist (map (cdr (quail-map)))
          (let* ((to (car map))
                 (from (quail-get-translation
                        (cadr map) (char-to-string to) 1)))
            (when (and (characterp from) (characterp to))
              (dolist (mod modifiers)
                (define-key local-function-key-map
                  (vector (append mod (list from)))
                  (vector (append mod (list to)))))))))
      (when input-method
        (activate-input-method current))))

eval expression
---------------

`M-:`

better defaults
---------------

https://github.com/technomancy/better-defaults

starter kit
-----------

(?)

http://eschulte.github.io/emacs-starter-kit/
https://eschulte.github.io/emacs24-starter-kit/
