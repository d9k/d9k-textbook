# JS: browser: async

## `requestAnimationFrame`

- :newspaper: [JavaScript: заметка о requestAnimationFrame и requestIdleCallback | aio350 | Хабр](https://habr.com/ru/companies/timeweb/articles/587908/)

- :newspaper: [JavaScript Animation: requestAnimationFrame и requestIdleCallback | Миронов Стёпа | TimeWeb](https://timeweb.com/ru/community/articles/chto-takoe-javascript-animation-requestanimationframe-i-requestidlecallback)

- :newspaper: [Happy practices for requestIdleCallback and AnimationFrame | Luis Ball](https://www.luisball.com/blog/request-animation-frame-versus-request-idle-callback)

- :newspaper: [Optimize JavaScript execution | Paul Lewis | web.dev](https://web.dev/articles/optimize-javascript-execution)

При создании нескольких анимаций на одной странице через `setInterval` возникает проблема перегрузки процессора из-за чрезмерного количества кадров в секунду.

It makes sense to throttle most things with `rAF` because you wouldn't request layout changes from the browser more often than it renders the layout. However, many browser events are already synced to the browser's rendering of the page, like scroll. So, instead, `rAF` is used to move layout modification to the end of a frame. This avoid invalidating the DOM layout before you've had a chance to finish running all the logic inside the same frame.

RAF выдает разрешение на новую анимацию, если выполнены следующие условия
- не перегружен процессор;
- завершен тайминг предыдущего видео;
- достаточный заряд аккумулятора (у ноутбуков);

```js
// Запустить 1 раз
let requestId = requestAnimationFrame(callbackFn)
// . . . . .
// Можно отменить запуск при необходимости
cancelAnimationFrame(requestId);
```

`performance.now()` можно использовать для расчёта милисекунд с прошлого запуска `callbackFn`.

## `requestIdleCallback`

- :newspaper: [JavaScript: заметка о requestAnimationFrame и requestIdleCallback | aio350 | Хабр](https://habr.com/ru/companies/timeweb/articles/587908/)

- :newspaper: [JavaScript Animation: requestAnimationFrame и requestIdleCallback | Миронов Стёпа | TimeWeb](https://timeweb.com/ru/community/articles/chto-takoe-javascript-animation-requestanimationframe-i-requestidlecallback)

- :newspaper: [Detailed Analysis of requestIdleCallback vs. requestAnimationFrame](https://en.blog.jasonzk.com/js/requestidlecallback-and-requestanimationframe/)

Не очень с поддержкой в Safari.

`requestIdleCallback` – это механизм, который позволяет браузеру выполнять задачи в «свободное» время, когда нет активных действий, таких как анимации или взаимодействие с пользователем. Основная идея заключается в том, чтобы максимально эффективно использовать ресурсы компьютера, не мешая основным действиям.

`requestIdleCallback` позволяет выполнять низкоприоритетные операции в период простоя браузера (отсюда "idle") внутри фрейма (обычно, это происходит после вычисления браузером макета и его перерисовки, когда осталось какое-то время перед синхронизацией). Даже если с точки зрения пользователя страница "подвисает", могут быть периоды, когда браузер находится в режиме ожидания. Максимальная продолжительность времени, формально предоставляемая rIC для выполнения задачи, составляет 50 мс. Фактически же в нашем распоряжении имеется всего 0.5-10 мс. Поэтому, если внутри rIC вызывается функция для изменения DOM, ее следует вызывать с помощью rAF. Это объясняется тем, что модификация DOM — это потенциально продолжительная операция, на выполнение которой в rIC может не хватить времени.

Обработку события прокрутки вполне можно отнести к низкоприоритетным задачам. Поэтому для задержки вызова таких обработчиков можно использовать RIC.

Use Cases and Best Practices:
- Data Preloading: Preload data that users might access in idle time to improve subsequent operation responsiveness.
- Logging: Record user actions or statistical information that does not need to be executed immediately.
- Data Synchronization: Sync user data to the server or fetch updated data from the server.

`rIC` calls are not an ideal place to preform DOM modifications, since the DOM reference at invocation could already have been invalidated.