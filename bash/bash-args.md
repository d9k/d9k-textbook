# Обработка аргументов в bash

## Проверить количество аргументов

    if [ $# -lt 2 ]; then
        echo "wrong number of arguments"
        echo "usage: name arg1 arg2"
        exit 1;
    fi

## Обработка ключей

```
args_parse() {
    while [[ $# > 0 ]]; do
        key="$1"

        case $key in
            -t|--task)
                TASK="$2"
                shift # past argument
                ;;
            --default) # argument without value
                DEFAULT=1
                ;;
            *)
                   help_exit
                ;;
        esac
        shift # past argument or value
    done
}

args_parse "$@"
```

## Передача всех аргументов в другой скрипт/функцию

    another_script "$@"

## Путь скрипта

    CURRENT_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

## Имя скрипта

    SCRIPT_NAME="$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
