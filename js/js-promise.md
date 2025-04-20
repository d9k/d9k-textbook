# JS: promises

`Promise` (Обещание) в JavaScript — это объект, представляющий состояние выполнения асинхронной операции: `pending`, `fulfilled`, `rejected`.

К объекту `Promise` можно добавлять callback'и с помощью цепочек вызовов `.then()`, `.catch()`, `.finally()`, управляя обработкой результатов и ошибок асинхронной операции. Введение `Promise` позволило избежать callback hell - вложенных на много уровней друг в друга callback'ов, со сложностями в отладке и обработке ошибок.

## Await all in parallel

```js
const a = async () => 'a'
const b = async () => 'b'
const c = async () => 'c'
await Promise.join(a(), b(), c()) === ['a', 'b', 'c']
```
