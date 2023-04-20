# xfce4-terminal

## Отключение сочетаний клавиш

могут мешать в консольных редакторах или tmux

Задать пустое значение сочетания клавиш в `~/.config/xfce4/terminal/accels.scm`, например:

```
(gtk_accel_path "<Actions>/terminal-window/close-tab" "")
```

## Размер xfce4-terminal по-умолчанию

`~/.config/Terminal/terminalrc`
`~/.config/xfce4/terminal`

```
MiscDefaultGeometry=100x50+220+70
(100x50 symbols
shift 220;70 pixels)
```


