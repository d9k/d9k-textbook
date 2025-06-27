# JS: promises

- :beginner: [Promise - JavaScript | MDN](https://developer.mozilla.org/ru/docs/Web/JavaScript/Reference/Global_Objects/Promise)

`Promise` (Обещание) в JavaScript — это объект, представляющий состояние выполнения асинхронной операции: `pending`, `fulfilled`, `rejected`.

К объекту `Promise` можно добавлять callback'и с помощью цепочек вызовов `.then()`, `.catch()`, `.finally()`, управляя обработкой результатов и ошибок асинхронной операции. Введение `Promise` позволило избежать callback hell - вложенных на много уровней друг в друга callback'ов, со сложностями в отладке и обработке ошибок.

## Жизненный цикл Promise

:newspaper: [Promise | краткое руководство/ Песочница | Хабр](https://habr.com/ru/sandbox/162207/), 2021

State - pending / fulfilled / rejected - 3 состояния.

Fate - unresolved / resolved - 2 состояния.

Settled - завершённость - settled / unsettled - 2 состояния.

### Определение состояния Promise

:speech_balloon: [How can I synchronously determine a JavaScript Promise's state? | SO](https://stackoverflow.com/questions/30564053/how-can-i-synchronously-determine-a-javascript-promises-state)

No such synchronous inspection API exists for native JavaScript promises. It is impossible to do this with native promises. The specification does not specify such a method.

- [promise-status-async](https://github.com/kudla/promise-status-async) by [kudla](https://github.com/kudla)
	- _Promise status management tool_

## Статические методы Promise

:newspaper: [Promise | краткое руководство/ Песочница | Хабр](https://habr.com/ru/sandbox/162207/), 2021

### `.all()`

Нужны все выполненные.

- `onRejected`: причина первого отклоненного промиса (если было отклонение).
- `onFulfilled`: массив результатов с сохранением порядка после выполнения всех promise.

### `.allSettled()`

Нужны все завершённые.

- `onFulfilled`: массив результатов с сохранением порядка.

### `.race()`

Нужен первый завершенный.

- `onFulfilled`: результат любого промиса, который первым выполнится или отклонится.

### `.any()`

Нужен хотя бы один выполненный.

- `onFulfilled`: результат первого выполненного промиса.
- `onRejected`: _AggregateError: All promises were rejected_ если все отклонены.
