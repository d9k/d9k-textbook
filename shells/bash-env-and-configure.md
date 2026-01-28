# Bash: environment and configuration

## set и shopt: разница

Параметры `set` наследуются или заимствуются из параметров других оболочек, в то время как параметры `shopt` созданы в bash.

https://habr.com/ru/post/452522/

## Текущие опции

```bash
set -o
shopt
```

- :speech_balloon: [shell - What is the maximum size of a Linux environment variable value? | SO](https://stackoverflow.com/questions/1078031/what-is-the-maximum-size-of-a-linux-environment-variable-value)

## What is the maximum size of a Linux environment variable value? | SO

https://stackoverflow.com/questions/1078031/what-is-the-maximum-size-of-a-linux-environment-variable-value

```bash
getconf -a | grep ARG_MAX

true | xargs --show-limits
```