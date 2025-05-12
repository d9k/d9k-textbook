# Security: XSS

- :newspaper: [Что такое XSS-уязвимость и как тестировщику не пропустить ее | saver | Хабр](https://habr.com/ru/articles/511318/)

Суть: злоумышленнику удается внедрить на страницу JavaScript-код, который не был предусмотрен разработчиками.

- :newspaper: [Очевидные 3 правила безопасности | artch | Хабр](https://habr.com/ru/articles/143259/), 2012

- Правило №1. Делайте все авторизационные куки HttpOnly
- Правило №2. Выполняйте действия через POST, защищая случайным ключом
	- сравнивать случайный ключ из переданного от клиента запроса с этим же ключом в куке.
- Правило №3. Не доверяйте браузеру

## Validate data

- [detergent](https://github.com/codsen/codsen/tree/main/packages/detergent) by [codsen](https://github.com/codsen)
- [string-strip-html](https://github.com/codsen/codsen/tree/main/packages/string-strip-html) by [codsen](https://github.com/codsen)

## CSP

***Content Security Policy***

- :newspaper: [Улучшение сетевой безопасности с помощью Content Security Policy | Хабр](https://habr.com/ru/companies/nix/articles/271575/)

```http
Content-Security-Policy:    default-src 'self';
                            style-src http://cdn.example.com;
                            script-src 'self' http://cdn.example.com;
							font-src https:
```

- :beginner: [CSP: connect-src - HTTP | MDN](https://developer.mozilla.org/en-US/docs/Web/HTTP/Reference/Headers/Content-Security-Policy/connect-src)

CSP `connect-src` directive restricts the URLs which can be loaded using script interfaces.

## Cookies: HttpOnly / Secure / Same-Site

- :newspaper: [CSRF (межсайтовая подделка запросов): что это за уязвимость](https://blog.skillfactory.ru/glossary/csrf/), 2023
- :newspaper: [\[Перевод\] Всё о файлах cookie и их безопасности | Хабр](https://habr.com/ru/articles/710578/), 2023
- :newspaper: [SameSite cookies explained | web.dev](https://web.dev/articles/samesite-cookies-explained)

- `SameSite=Lax` или `SameSite=Strict`
- `Secure=true`
- `HttpOnly=true`

- :point_right: [inet-cookies.md](../inet/inet-cookies.md), глава "Атрибуты cookies"

## Анти-CSRF-токены

- :newspaper: [CSRF (межсайтовая подделка запросов): что это за уязвимость](https://blog.skillfactory.ru/glossary/csrf/)

CSRF (cross-site request forgery, подделка межсайтовых запросов) — вид атак на сайт, при которой злоумышленник с помощью мошеннического сайта или скрипта заставляет браузер пользователя выполнять на доверенном сайте действия от его имени: отправлять сообщения, менять пароли, переводить деньги со счета на счет и пр.

anti-CSRF-токены напоминают cookies. Это данные, которые сервер отправляет браузеру при загрузке каждой страницы в ожидании получить их обратно. Отличие в следующем: сервер должен отправить браузеру уникальный токен и проверить, присылает ли его браузер в последующем запросе.

## Подтверждение действий от пользователя

- [CSRF (межсайтовая подделка запросов): что это за уязвимость](https://blog.skillfactory.ru/glossary/csrf/)

Для отправки денежных средств, изменения аутентификационных данных и т.д. хорошая практика — дополнительное подтверждающее действие. Например, после попытки смены пароля можно попросить пользователя нажать на кнопку на сайте или ввести капчу.