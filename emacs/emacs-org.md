emacs orgmode
=============

Сочетания клавиш
----------------

`C-c C-o` open url
`tab` expand
`M-x org-cycle` expand all
`S-Tab` = `M-x org-toggle-link-display`
`M-x org-tooggle-inline-image`
`M-enter` добавить элемент в список

Разметка
--------

Таски

    - [X] Задача (C-c C-c) для переключения состояния её и подзадач
    - [ ] Новая задача (M-S-Enter)
    
    #+COMMENT: this will never be exported

    #+BEGIN_COMMENT
    multi
    line
    comment
    #+END_COMMENT

    *** COMMENT no exported either

Текст:

    - *bold*
    - /italic/
    - _underline_
    - +strike through+
    - =code=
    - ~commands~

Блоки: Нажать `<`, затем букву из списка ниже, затем `tab`

    s 	#+BEGIN_SRC ... #+END_SRC
    e 	#+BEGIN_EXAMPLE ... #+END_EXAMPLE
    q 	#+BEGIN_QUOTE ... #+END_QUOTE
    v 	#+BEGIN_VERSE ... #+END_VERSE
    c 	#+BEGIN_CENTER ... #+END_CENTER
    l 	#+BEGIN_LaTeX ... #+END_LaTeX
    L 	#+LaTeX:
    h 	#+BEGIN_HTML ... #+END_HTML
    H 	#+HTML:
    a 	#+BEGIN_ASCII ... #+END_ASCII
    A 	#+ASCII:
    i 	#+INDEX: line
    I 	#+INCLUDE: line 

Для блока кода: `C-'` редактирует его в отдельном буфере

Для заголовка: `C-c C-c` добавляет тэги

Таблицы
-------

    |Name|Phone|Ahe
    |-

Затем нажать `S-tab`/`tab`/`enter`(заодно это навигация) или `C-c` и таблица достроится.
`|-` - разделительная черта

`M-a`/`M-e` - в начало/конец строки
`C-|` - построить таблицу из блока
    
`M-<left>`/`M-<right>` - перемещение колонок
`M-S-<left>`/`M-S-<right>` - удаление/добавление колонок
Соответственно и для строк.

`С-с -` разделитель под строкой
`C-c ^` сортировка

http://orgmode.org/org.html#Tables

Ссылки
------

[main site](http://orgmode.org/manual/index.html)
[wiki](http://en.wikipedia.org/wiki/Org-mode)

Экспорт
-------

`C-c C-r h h` в html

`org-babel-tanhe`/`C-c C-v t` экспорт в код

http://orgmode.org/worg/org-contrib/babel/intro.html
