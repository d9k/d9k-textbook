# Функции bash


## Сохранение результата работы функции в переменную

```
function scan {
  echo "output"
}
VAR=$(scan)
```

http://www.tldp.org/LDP/abs/html/complexfunct.html

## Функция с параметром

```
name(){
  if [ $# -lt 2 ]; then
    echo "wrong number of arguments"
      echo "usage: name arg1 arg2"
      exit 1;
  fi
  arg1=$1
  arg2=$2
  echo $arg1
}

name foo bar
name ararar
```

http://bash.cyberciti.biz/guide/Pass_arguments_into_a_function
