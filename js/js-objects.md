# JS объекты

- JS objects Jupyter Notebook [^j]

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

## What is the purpose of freeze method

1. It is used for freezing objects and arrays.
2. It is used to make an object immutable.

freezing is only applied to the top-level properties!

## Proxy

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Proxy

Available methods: `apply (method call), deleteProperty, get, set...`

## Proxy object use cases

Binding to DOM element value, caching (web requests), validation, read-only or private properties

- https://blog.logrocket.com/practical-use-cases-for-javascript-es6-proxies/

## `seal()`, `preventExtensions()`, `freeze()` difference

`freeze()` restricts change, delete or add properties (but only on 1-st level).

`seal()` restricts adding new properties or deleting from object. Change of existing properties is allows.

`preventExtensions()` - restrict adding new properties, allows change and delete.

- https://javascript.plainenglish.io/object-freeze-vs-object-seal-vs-object-preventextensions-e78ef3a24201

## Links

[^1]: [js objects jupiter notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-objects.ipynb)
