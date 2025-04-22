# NodeJS: memory

- :point_right: [nodejs-performance](./nodejs-performance.md)

## Примеры утечек памяти в NodeJS

- Добавление данных в глобальный массив, который никогда не очищается:

	- Очищайте массив или используйте `WeakMap`/`WeakSet`.

- Обращение к внешней переменной из callback, передаваемого в `setInterval`.
	- Используйте `clearInterval`.

- Не закрытые ресурсы - закрывать файловые дескрипторы (`fs.close()`).

- Замыкания в функциях высшего порядка:

```js
function createClosureLeak() {
  const bigData = new Array(1000000).fill('*'); // Большие данные

  return function() {
    console.log('Это замыкание удерживает bigData в памяти!');
  };
}

const leakyFunc = createClosureLeak();
// Теперь leakyFunc хранит ссылку на bigData, даже если она не используется
 Исправление: присвоить null.

leakyFunc = null; // Теперь bigData может быть собрана GC.
```

- Забывать очищать обработчики событий: `emitter.on('event,...)`
	- Решение: `emitter.off('event',...)`

- Используйте кэши с ограничениями. Например, `lru-cache` из npm:
	- [node-lru-cache](https://github.com/isaacs/node-lru-cache) by [isaacs](https://github.com/isaacs)
		- _A fast cache that automatically deletes the least recently used items_

## Диагностика утечек

- `process.memoryUsage()` для отслеживания потребления памяти.
- `heapdump` для создания снимков памяти.
	- [node-heapdump](https://github.com/bnoordhuis/node-heapdump) by [bnoordhuis](https://github.com/bnoordhuis)
		- _Make a dump of the V8 heap for later inspection._
- `node --inspect` + Chrome DevTools (вкладка Memory).
	- [Как находить и устранять утечки памяти на примере Яндекс.Почты / Хабр](https://habr.com/ru/companies/yandex/articles/195198/), 2013
		- `Shallow size` — чистое количество памяти, занимаемое объектом. `Retained size` — это общее количество памяти, которое освободится при сборке мусора, если удалить объект и все ссылки на него от корня графа.

- Утечки не всегда очевидны. Например, они могут проявляться только под нагрузкой. Поэтому всегда тестируйте приложение с помощью нагрузочных тестов (например, через ***artillery***).
	- [artillery](https://github.com/artilleryio/artillery) by [artilleryio](https://github.com/artilleryio)
		- _The complete load testing platform. Everything you need for production-grade load testt with Playwright, HTTP APIs, GraphQL, WebSocket, and more_