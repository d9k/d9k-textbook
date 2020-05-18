# Bash: управление процессами

## Найти процесс по части выполненной команды

`ps aux | grep -i "firefox" | grep -v "^grep" | awk {'print $2'} | xargs kill -9`
