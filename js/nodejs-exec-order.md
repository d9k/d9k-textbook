# NodeJS: exec order

- :point_right: [js-exec-order](./js-exec-order.md)

## Eventloop in NodeJS: Understanding setTimeout, setImmediate vs process.nextTick | DKatalis

- https://medium.com/dkatalis/eventloop-in-nodejs-settimeout-setimmediate-vs-process-nexttick-37c852c67acb

`process.nextTick()` is processed at the starting of the event loop and between each phase of the event loop.

On any given context `process.nextTick()` has higher priority over `setImmediate()`.

We recommend developers use `setImmediate()` in default case because it’s easier to reason about.

Recursive `process.nextTick()` will block the event loop and create **I/O Starvation**. Recursive calls to `setImmediate()` won't block the event loop, because every recursive call is executed only on the next event loop iteration.

`while` blocks micro/macro-task queues:

- :balloon: [example | JS Visualizer 9000](https://www.jsv9000.app/?code=Y29uc29sZS5sb2coJ0ZvbzogU3RhcnQnLCBuZXcgRGF0ZSgpLnRvTG9jYWxlVGltZVN0cmluZygpKTsKCnNldFRpbWVvdXQoKCkgPT4gewogIGNvbnNvbGUubG9nKAogICAgJ1BvbzogVG8gYmUgY2FsbGVkIGluIDIgc2Vjb25kcyAnLAogICAgbmV3IERhdGUoKS50b0xvY2FsZVRpbWVTdHJpbmcoKQogICk7Cn0sIDIwMDApOwoKY29uc3Qgd2FpdGxvZ0Zvck5zZWNvbmRzID0gc2Vjb25kcyA9PiB7CiAgY29uc3Qgc3RhcnRUaW1lID0gbmV3IERhdGUoKS5nZXRUaW1lKCk7CiAgY29uc3QgbWlsbGlzZWNvbmRzID0gMTAwMDsKICBjb25zdCBlbmRUaW1lID0gc3RhcnRUaW1lICsgc2Vjb25kcyAqIG1pbGxpc2Vjb25kczsKICBsZXQgY3VyclRpbWUgPSBuZXcgRGF0ZSgpLmdldFRpbWUoKTsKICB3aGlsZSAoZW5kVGltZSA%2BIGN1cnJUaW1lKSB7CiAgICBjdXJyVGltZSA9IG5ldyBEYXRlKCkuZ2V0VGltZSgpOwogIH0KICBjb25zb2xlLmxvZygKICAgIGBHb286IFRvIGJlIGNhbGxlZCBhZnRlciAke3NlY29uZHN9IEVuZCBgLAogICAgbmV3IERhdGUoKS50b0xvY2FsZVRpbWVTdHJpbmcoKQogICk7Cn07Cgp3YWl0bG9nRm9yTnNlY29uZHMoNCk7Cgpjb25zb2xlLmxvZygnQmFyOiAnLCBuZXcgRGF0ZSgpLnRvTG9jYWxlVGltZVN0cmluZygpKTsK)

- :speech_balloon: [javascript - Why is my infinite loop blocking when it is in an async function? | SO](https://stackoverflow.com/questions/54478255/why-is-my-infinite-loop-blocking-when-it-is-in-an-async-function)

## Difference between process.nextTick() and setImmediate() Methods | GeeksforGeeks

- https://www.geeksforgeeks.org/difference-between-process-nexttick-and-setimmediate-methods/

`process.nextTick()` runs code immediately after the current operation, before I/O tasks. `setImmediate()` schedules code to run after the current event loop phase, following I/O tasks, impacting execution timing.

## Node.js Event Loop phases

- https://nodejs.org/en/learn/asynchronous-work/event-loop-timers-and-nexttick

Each phase has a FIFO queue of callbacks to execute. While each phase is special in its own way, generally, when the event loop enters a given phase, it will perform any operations specific to that phase, then execute callbacks in that phase's queue until the queue has been exhausted or the maximum number of callbacks has executed. When the queue has been exhausted or the callback limit is reached, the event loop will move to the next phase, and so on.

Phases Overview
- timers: this phase executes callbacks scheduled by `setTimeout()` and `setInterval()`.
- pending callbacks: executes I/O callbacks deferred to the next loop iteration.
- idle, prepare: only used internally.
- poll: retrieve new I/O events; execute I/O related callbacks (almost all with the exception of close callbacks, the ones scheduled by timers, and `setImmediate())`; node will block here when appropriate.
- check handlers: `setImmediate()` callbacks are invoked here.
- close callbacks: some close callbacks, e.g. `socket.on('close', ...)`.

## Node.js — Understanding process.nextTick()

- https://nodejs.org/en/learn/asynchronous-work/understanding-processnexttick

The way we can tell the JS engine to process a function asynchronously (after the current function), but as soon as possible, not queue it.

Calling `setTimeout(() => {}, 0)` will execute the function at the end of next tick, much later than when using `nextTick()` which prioritizes the call and executes it just before the beginning of the next tick.

```js
console.log('Hello => number 1');

setImmediate(() => {
  console.log('Running before the timeout => number 3');
});

setTimeout(() => {
  console.log('The timeout running last => number 4');
}, 0);

process.nextTick(() => {
  console.log('Running at next tick => number 2');
});
```

## Лучшие практики асинхронности в NodeJS

Разбивайте CPU-интенсивные задачи на части с помощью `setImmediate()`

Используйте Worker Threads для тяжелых вычислений

Избегайте рекурсивных вызовов `process.nextTick()`

Используйте асинхронные API везде, где возможно

NodeJS, в отличие от браузера:

```js
setTimeout(() => console.log('timer'), 0);
setImmediate(() => console.log('immediate'));
```

результат может быть разным, т. к. зависит от фазы poll

В браузере нет аналога `setImmediate()`, но есть `requestAnimationFrame()` для синхронизации с рендерингом