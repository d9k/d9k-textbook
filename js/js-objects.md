# JS объекты

See also [js class](./js-class.md), [js prototype](./js-prototype.md).

## Получить собственные поля объекта

`Reflect.ownKeys(obj)`

## Define property

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty

## Объекты обёртки простых типов

Самое сложное происходит со строками, числами и булевыми значениями.

```js
> Object(5.56).toPrecision(2)
5.6
> (5.56).toPrecision(2)
5.6
```
Как мы помним, они не объекты. Но если мы попытаемся получить доступ к их свойствам, то тогда будет создан временный объект-обёртка с использованием встроенных конструкторов String, Number и Boolean, который предоставит методы и после этого исчезнет.

Эти объекты создаются невидимо для нас, и большая часть движков оптимизирует этот процесс, но спецификация описывает это именно таким образом. Методы этих объектов также находятся в прототипах, доступных как String.prototype, Number.prototype и Boolean.prototype.
