ZShell
======

http://muhas.ru/?t=zsh
http://habrahabr.ru/post/42680/

см. linux_autoload.txt

автодополнение
--------------

	fpath=(~/opt/drush_zsh/zsh $fpath)
	autoload -U compinit
	compinit -i&


	[из readme к репозиторию drush zsh](https://github.com/webflo/drush_zsh_completion)

смена цвета
-----------

    prompt adam1 red red red

zsh: corrupt history file
-------------------------

    mv .zsh_history .zsh_history_bad
    strings .zsh_history_bad > .zsh_history
    fc -R .zsh_history

Скрывать из истории команды
---------------------------

Команды, начинающиеся с пробела

`setopt histignorespace`