============
 Рецепты hg
============

## Закрыть ветку

Обновить на ненужный коммит

	  hg update

Переименовать ветку

	  hg branch NewName

Сделать коммит в неё, чтобы отделить от других веток

    hg commit --amend

Сделать прощальный коммит

  	hg commit --close-branch -m 'close badbranch, this approach never worked'

Для всех ненужных коммитов, чтобы не пушилось на сервер:

	  hg phase --force --secret [rev_hash]

Перейти обратно на главную ветку
  	hg up -C default # switch back to "good" branch

##Графический консольный лог

  	hg log -G

Добавить в `~/.hgrc`

	  [extensions]
	  graphlog =

##Изменения файлов

	  hg status --rev x:y

где y > x

##push висит и ничего не пишет

Добавьте параметр `--debug`

##Избавиться от постоянного ввода пароля

keyring extension:

	  sudo apt-get install mercurial-keyring

	  sudo easy_install keyring
	  sudo easy_install mercurial_keyring

`~/.hgrc`:

	  [extensions]
	  mercurial_keyring=

http://choorucode.com/2013/03/17/how-to-install-mercurial-keyring-extension-on-ubuntu/

##Autopush

`.hg/hgrc`+:

	  [hooks]
	  commit.autopush = hg push &

## История изменений файлов

`hg diff -r <first_revision_number>:<other_revision_number> filename`

(revision numbers from `hg log`)

можно отрицательное смещение (относительно текущей ревизии):

`hg diff -r -2:-1 filename`

см. https://stackoverflow.com/questions/4154382/view-differences-between-two-changesets-on-one-file

## Список всех веток (включая незакрытые)

`hg branches --closed`

## Откатить изменения

`hg backout rev_number`

https://www.mercurial-scm.org/wiki/Backout

## diff предыдущего коммита

`hg diff -c tip`

## Поиск ревизий по автору и изменяющие файлы в определённой папке

`hg log -l 50 -r "author(d9k) and file('console/views/**')"`
