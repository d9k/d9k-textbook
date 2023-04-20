# Горячие клавиши tmux

Ctrl+b % — разделить текущую панель на две, по вертикали
Ctrl+b " — разделить текущую панель на две, по горизонтали (это кавычка, которая около Enter, а не Shift+2);
Ctrl+b & — закрыть окошко (а можно просто набрать exit в терминале)
Ctrl+b x — закрыть панель
Ctrl+b →←↑↓ — переходить между панелями
Ctrl+b Ctrl+→←↑↓ — изменять относительный размер панелей
Ctrl+d exit

ctrl+b d - отсоединиться (выход)

## окна

ctrl+b c - новое окно
ctrl+b (0..9) - переход в окно с нужным №

## Команды

`Ctrl+b : resize-pane -D 10` - вниз на 10 строк разделительную черту

## копирование

<!--- //Ctrl+b PgUp -->
Ctrl+b [ — вход в «режим копирования», после чего:
Alt+w - копировать (как в emacs)
q — выход из «режима копирования».

http://habrahabr.ru/post/126996/
https://gist.github.com/andreyvit/2921703

## разделение по-умолчанию

1)

`~/.tmux.conf`:

	bind S source-file ~/.tmux/session1

`~/.tmux/session1`:

	neww
	splitw -v -p 25 -t 0
	#selectw -t 1
	selectp -t 0

	http://stackoverflow.com/questions/5609192/how-to-set-up-tmux-so-that-it-starts-up-with-specified-windows-opened

и вызывать по ctrl+B shift+S

2) sh-скрипт:

	#/bin/bash

	tmux new-session -d -s 'general' 'zsh'
	tmux split-window -v -p 25 'zsh'
	# tmux split-window -h
	# tmux new-window 'mutt'
	tmux select-pane -t 0
	tmux attach-session -d -t 'general'

## подключение к сессии

unix.stackexchange.com/questions/24274/attach-to-different-windows-in-session

## переключение окон

bind-key C-a next-window
bind-key C-q previous-window

## Перемещение панели в другое окно

`<prefix> !`
`:join-pane -t <win_num>`

https://bezhermoso.github.io/til/move-a-tmux-pane-from-one-window-to-another/

## Поиск

реверсивный

`Ctrl-B` `Ctrl+R`, затем `n`

обычный

`Ctrl-B` `Ctrl+R`, затем `n`