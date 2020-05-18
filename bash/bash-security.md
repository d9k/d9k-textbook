Безопасность bash
=================

## Отключение истории

    # Turn off
    set +o history
    # Turn on
    set -o history

http://unix.stackexchange.com/questions/10922/temporarily-suspend-bash-history-on-a-given-shell

Можно скрывать из истории команды, начинающиеся с пробела

    HISTCONTROL="ignoreboth"
    # или HISTCONTROL="ignorespace"
    # или HISTCONTROL="ignoredups:ignorespace"