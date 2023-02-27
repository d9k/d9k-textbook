# TortoseGit

## WinMerge: аргументы командной строки

https://manual.winmerge.org/en/Command_line.html

## WinMerge: настройка 3-way-diff

Default (мерж в правую панель):

```
C:\Program Files\WinMerge\WinMergeU.exe /e /ub /fr /wl /wm /dl %bname /dm %tname /dr %yname  %base %theirs %mine /o %merged /ar
```

Поменять местами среднюю и правую панель (мерж в среднюю панель)

```
C:\Program Files\WinMerge\WinMergeU.exe /e /ul /ur /fm /wl /wr /dl %bname /dm %yname /dr %tname  %base %mine %theirs /o %merged
```

Авто-мерж (`/ar` / `/al`, `/am`) отключен, т. к. может безвозвратно удалить строки.