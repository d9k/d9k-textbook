# Node.JS: garbage collector

- :beginner: [Node.js — Understanding and Tuning Memory](https://nodejs.org/en/learn/diagnostics/memory/understanding-and-tuning-memory)

Сборщик мусора мешает вычислениям реального времени: но можно изменить его интервал запуска `--gc-interval`, либо вовсе отключить, если запускать с флагом `--expose-gc` и вручную вызывать `global.gc()`.

- :newspaper: [Node.js Top 1% Engineer— Garbage Collection | by Peter K | Medium](https://medium.com/@pkulcsarsz/node-js-top-1-engineer-step-two-garbage-collection-8316a21e10c7)