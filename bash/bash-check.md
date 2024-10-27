# Bash: проверка переменных на пустоту, равенство и т. д.

[Introduction to if](http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html)

keywords: check, compare, equal, condition

## Проверка строки на пустоту

```bash
if [ -z "$VAR" ]; then
    echo "VAR is empty"
fi

if test -z "$VAR"; then
  echo "VAR is empty"
fi

if [ -n "$VAR" ]; then
    echo "VAR is not empty"
fi
```

## Проверка строк на равенство

Обратить внимание на пробелы!

в случае неравенства `==` заменить на `!=`

```bash
if [[ "$db_pass" == "$db_pass_repeat" ]]; then
    echo "password doesn't match"
    exit
fi
```

## Проверка чисел на равенство/неравенство

```bash
if [ "$a" -eq "$b" ]
if [ "$a" -ne "$b" ]
```

## Проверка количества входных аргументов

```bash
function echoUsage(){
    echo command_name PARAM1 PARAM2
}
if [[ "$#" -lt 2 ]]; then
    echoUsage
    exit
fi
```

## Проверка на несуществование файла

```bash
if [ ! -f /tmp/foo.txt ]; then
    echo "File not found!"
fi
```

## Проверка начала строки

```bash
if [[ $str == First\ few\ words* ]]; then
    echo "Matches"
fi
```
