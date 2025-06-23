# Browser: CORS

Cross-origin resource sharing «совместное использование ресурсов между разными источниками».

```
Access-Control-Allow-Origin: http://example.com http://www.b.com
```

```
Access-Control-Allow-Origin: *
```

## What is same-origin policy

The same-origin policy is a policy that prevents JavaScript from making requests across domain boundaries. An origin is defined as a combination of URI scheme, hostname, and port number. This policy is enabled by default and prevents a malicious script on one page from obtaining access to sensitive data on another web page using Document Object Model(DOM).

https://github.com/sudheerj/javascript-interview-questions#what-is-same-origin-policy

## Preflight request

- :beginner: [CORS и preflight request: как работает, заголовки, кэш](https://sky.pro/wiki/javascript/cors-i-preflight-request-kak-rabotaet-zagolovki-kesh/)

OPTIONS request, using HTTP request headers Access-Control-Request-Method, Origin, and optionally Access-Control-Request-Headers

💡 Простыми словами, preflight запрос – это как если бы вы перед покупкой в магазине звонили туда и спрашивали, можно ли купить товар определенным способом и взять с собой свою сумку. Если магазин говорит "да", вы идете на покупки. Если "нет" – вы не тратите свое время.

### Пример

Представьте, что вы строите веб-приложение, которое позволяет пользователям сохранять заметки онлайн. Ваше приложение (скажем, myapp.com) хочет отправить заметку на сервер, который находится на другом домене (notesapi.com). Вы решили использовать метод POST для отправки данных заметки.

Вот как выглядит ваш JavaScript код для отправки заметки:

```js
fetch("https://notesapi.com/api/notes", {
  method: "POST",
  headers: {
    "Content-Type": "application/json",
    "Authorization": "Bearer ваш_токен_авторизации"
  },
  body: JSON.stringify({
    title: "Моя новая заметка",
    content: "Содержимое моей новой заметки"
  })
});
```

Preflight Request: Перед тем, как отправить ваш POST запрос, ваш браузер автоматически отправляет предварительный запрос (preflight request) используя метод OPTIONS. Этот запрос спрашивает сервер notesapi.com, может ли он принять ваш основной запрос с такими заголовками и методом.

Заголовки Preflight Request: В этом запросе браузер включает заголовки, такие как Access-Control-Request-Method (со значением POST), Access-Control-Request-Headers (со значениями, которые вы хотите использовать, например, Content-Type и Authorization), и Origin (со значением https://myapp.com).

Ответ сервера: Если сервер notesapi.com настроен правильно и разрешает такие запросы, он ответит на preflight запрос с заголовками, указывающими, что ваше приложение на myapp.com может отправлять запросы методом POST и использовать нужные заголовки.

Отправка основного запроса: Только после получения положительного ответа от сервера на preflight запрос, ваш браузер отправит основной POST запрос с данными заметки.

### Ответ сервера на preflight запрос может включать:

- Access-Control-Allow-Origin: указывает, какие домены могут получать ответы.
- Access-Control-Allow-Methods: перечисляет методы, разрешенные для кросс-доменных запросов.
- Access-Control-Allow-Headers: указывает, какие заголовки разрешены в запросе.
- Access-Control-Max-Age: сообщает, как долго результат preflight запроса может быть кэширован.

### Оптимизация

Рекомендуется в preflight-овете сервера возвращать `Access-Control-Max-Age`.
