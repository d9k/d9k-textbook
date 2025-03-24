# Bash: управление процессами

## Найти процесс по части выполненной команды

`ps aux | grep -i "firefox" | grep -v "^grep" | awk {'print $2'} | xargs kill -9`

## Автоматический выход при падении

```
set -e
# Any subsequent(*) commands which fail will cause the shell script to exit immediately
```

Также будет возвращаться код результата (`$?`).

## Автоматический выход при падении одной команды

`RET="$?"; test $RET -ne 0 && exit $RET;`

сразу после команды. Также будет возвращаться код результата (`$?`).

