# JS async

## async & await

Remember, the await keyword is only valid inside async functions.

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function
## Why do we need callbacks

Javascript is an event driven language. That means instead of waiting for a response javascript will keep executing while listening for other events. Let's take an example with the first function invoking an API call(simulated by setTimeout) and the next function which logs the message.

## Event-driven programming

(Javascript is an event driven language.)

Событи́йно-ориенти́рованное программи́рование (СОП) — парадигма программирования, в которой выполнение программы определяется событиями — действиями пользователя, сообщениями от других программ и потоков, событиями операционной системы (устройства, сетевое пакеты).

СОП можно также архитектура построения компьютерной программы, при котором в коде (как правило, в головной функции программы) явным образом выделяется главный цикл приложения, тело которого состоит из двух частей: выборки события и обработки события.

https://ru.wikipedia.org/wiki/Событийно-ориентированное_программирование

## What are the three states of promise

Promises have 3 states:

1. **Pending:** This is an initial state of the Promise before an operation begins
2. **Fulfilled:** This state indicates that the specified operation was completed.
3. **Rejected:** This state indicates that the operation did not complete. In this case an error value will be thrown.