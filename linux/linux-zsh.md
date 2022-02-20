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

## Copy command

```
C() {} # you'll want this so that you don't get a command unrecognized error

preexec() {
  tmp="";
  if [ "${1:0:1}" = "C" ] && [ "${1:1:1}" = " " ] && [ "${1:2:1}" != " " ]; then
    for (( i=2; i<${#1}; i++ )); do
      tmp="${tmp}${1:$i:1}";
    done
    echo "$tmp" | xclip -selection clipboard;
  fi
}
```

https://stackoverflow.com/a/42265077/1760643

# ZSH hooks

```
(precmd)
    v
draw_prompt
    v
wait_for_input && input_command
    v
(preeexec)
    v
command_execution
    v
(precmd)...
```
