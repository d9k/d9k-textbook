# Architecture: microFrontends

## Micro-frontends advantages

- :newspaper: [What is Micro-Frontend? Benefits of Using Micro-Frontend Architecture | by Maruti Techlabs | Geek Culture | Medium](https://medium.com/geekculture/what-is-micro-frontend-benefits-of-using-micro-frontend-architecture-f6d667edb03d)

- ***Design and development flexibility*** - Micro-frontend architecture is not tied to any particular technology stack.

- ***Separate code bases*** - Keeping each team’s code separate guarantees more efficient development, testing, and deployment cycles. Technology agnosticism. Freedom to innovate. Fault seclusion. Faster build time.

- ***Favors native browser over custom APIs*** - micro-frontend architecture relies on browser events for communication instead of APIs, they are simpler to manage and maintain

- **Scalability** - Micro-frontends allow your development teams to make changes without impacting the overall speed of your online app.

- Autonomous teams — Building a website’s front end is complex. Companies often hit bottlenecks due to a lack of collaboration between their designers and engineers. **Maintainability**

- Reusability - easier to separate and reuse small modules across multiple microfrontend

## Коммуникация микрофронтендов

- :robot_face: (Разговор DeepSeek 2025.05.13) _Читал статью по микрофронтендам и там такие слова: "micro-frontend architecture relies on browser events for communication instead of APIs, they are simpler to manage and maintain". Какие события браузера используют микрофронтенды для коммуникации друг с другом?_

Плюсы и минусы использования стандартных браузерных API для коммуникаций микрофронтендов:
- :sparkles: Низкая связанность: Микрофронтенды не зависят от конкретных имплементаций друг друга.
- :sparkles: Универсальность: События работают даже между разными технологиями (React, Vue, Angular).
- :microbe: Порядок выполнения: Нет гарантии последовательности обработки событий.
- :microbe: Конфликты имен: События с одинаковыми именами могут пересекаться. Решение: использовать префиксы (app1:cartUpdated).

### CustomEvent
```js
// Микрофронтенд A отправляет событие
const event = new CustomEvent('userLoggedIn', {
  detail: { userId: 123 }, // Данные
  bubbles: true, // Всплывает по DOM
  composed: true // Преодолевает границы Shadow DOM
});
document.dispatchEvent(event);

// Микрофронтенд B слушает событие
document.addEventListener('userLoggedIn', (e) => {
  console.log('Пользователь вошел:', e.detail.userId);
});
```

### `window.postMessage()`

Также позволяет общаться с iframe и воркерами.

```js
// Отправка сообщения из iframe
window.parent.postMessage({
  type: 'cartUpdated',
  data: { items: 5 }
}, 'https://parent-domain.com');

// Родительское окно слушает
window.addEventListener('message', (e) => {
  if (e.origin !== 'https://child-domain.com') return; // Проверка источника
  if (e.data.type === 'cartUpdated') {
    console.log('Корзина обновлена:', e.data.data.items);
  }
});
```

Безопасность: важно проверять event.origin!

### События localStorage

```js
// Микрофронтенд A сохраняет данные
localStorage.setItem('theme', 'dark');

// Микрофронтенд B реагирует на изменение
window.addEventListener('storage', (e) => {
  if (e.key === 'theme') {
    console.log('Тема изменена:', e.newValue);
  }
});
```

### Event Bus

```js
// Создание шины
const eventBus = new EventTarget();

// Отправка события
eventBus.dispatchEvent(new CustomEvent('updateNotifications', { detail: { count: 3 } }));

// Подписка
eventBus.addEventListener('updateNotifications', (e) => {
  console.log('Уведомления:', e.detail.count);
});
```

## Micro-frontends Integration

- :newspaper: [Different Ways to Integrate Microfrontends | by Arunangshu Das | Medium](https://article.arunangshudas.com/different-ways-to-integrate-microfrontends-c1e5ae4e73cd)

### Micro-frontends client-side Integration

- `<iframe>`s
	- Each microfrontend can be loaded into its own iframe, ensuring complete isolation.
	- :sparkles: Strong isolation, easy to implement.
	- :microbe: Performance issues, lack of seamless interaction between microfrontends, SEO challenges.

- JavaScript Bundles
	- Microfrontends can be served as separate JavaScript bundles, which are dynamically loaded by the shell application at runtime.
	- :sparkles: Better performance compared to iframes, more seamless integration
	- :microbe: Managing dependencies and ensuring compatibility can be complex.

- [single-spa](https://github.com/single-spa/single-spa) by [single-spa](https://github.com/single-spa)
	- popular microfrontend framework that allows you to combine multiple frameworks on the same page without refreshing it.
	- _The router for easy microfrontends_
	- :sparkles: Framework agnostic, highly flexible, and robust ecosystem

### Server-side Integration

