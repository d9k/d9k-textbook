# Node.js: about

Удобно бизнес-модели frontend и backend писать на одном языке (JS/TS). Благодаря non-blocking async IO хорошо подходит под большого числа запросов на слабом железе. Не очень подходит для высоконагруженных вычислений (написанных на самом языке JS).

## Почему Node.js не подходит для сложных вычислений?

Не смотря на наличие JIT-компилятора, оптимизирующего часто выполняемый код, Java JVM всё-таки оптимизирована сильнее, не говоря уже о компилируемых в прямые инструкции к процессору языках (C, C++, Rust, Zig).

Есть worker threads для распараллеливания, но API ещё не очень развито. Обмен данными между потоками происходит через буферы (не так эффективно, как в других языках программирования).

Нет возможности задать целочисленный тип переменной или число с плавающей точкой другой разрядности. В результате в NodeJS потеря точности вычислений: `2 ** 53 === 2 ** 53 + 1`

Нет низкоуровнего управления памятью.

Сборщик мусора мешает вычислениям реального времени: но можно изменить его интервал запуска `--gc-interval`, либо вовсе отключить, если запускать с флагом `--expose-gc` и вручную вызывать `global.gc()`. См. [Node.js — Understanding and Tuning Memory](https://nodejs.org/en/learn/diagnostics/memory/understanding-and-tuning-memory)

- :speech_balloon: :speech_balloon: [node.js has a GIL and nobody talks about that either. The GIL is not relevant be... | Hacker News](https://news.ycombinator.com/item?id=10403301)[node.js has a GIL and nobody talks about that either. The GIL is not relevant be... | Hacker News](https://news.ycombinator.com/item?id=10403301)

## Node.js vs PHP

https://doit.software/blog/nodejs-vs-php

- Ability to share code and tests between the client-side (browser) and the server-side.
- Ability to create applications with real-time experience and streaming.
- Node is far easier to scale (than PHP).
