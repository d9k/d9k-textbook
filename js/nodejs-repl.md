# Node.js: REPL

## Запуск библиотек с import'ами

`node -r esm`

## Полезные сниппеты для REPL'а:

### сортировка по алфавиту

```
util.inspect.defaultOptions.sorted = true
util.inspect.defaultOptions.maxArrayLength = 1000
```

после этого для `console.log` включится сортировка и увеличится ограничение на число отображаемых элементов в массиве
