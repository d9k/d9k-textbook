# bash meta

## Выполнить код из переменной

```
command="cp $1 $2"
eval "${command}"
```

## Ignore alias

```
\vim
```

## Get value by variable name

```bash
A=55
N="A"
echo ${!N}
```
