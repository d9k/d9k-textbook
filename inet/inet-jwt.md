# Internet: JWT

- [JSON Web Tokens - jwt.io](https://jwt.io/)
- [Пять простых шагов для понимания JSON Web Tokens (JWT) / Хабр](https://habr.com/ru/articles/340146/)

***JSON Web Token (JWT)*** — это JSON-объект, который определен в открытом стандарте [RFC 7519](https://tools.ietf.org/html/rfc7519). Считается одним из безопасных способов передачи информации между двумя участниками.

***JWT*** — это лишь строка в формате `header.payload.signature`.

Содержит
	- 1) header - общая инф.-я по токену.
		- Пример: `{ "alg": "HS256", "typ": "JWT"}`
	- 2) payload - полезные данные (id пользователя, его роль...)
		- Пример: `{ "userId": "b08f86af-35da-48f2-8fab-cef3904660bd" }`
		- Примеры полей:
			- `iss` — issuer — определяет приложение, из которого отправляется токен.
			- `sub` — subject — определяет тему токена.
			- `exp` — expiration time — время жизни токена.
	- 3) signature - подпись

```js
SECRET_KEY = 'cAtwa1kkEy'
unsignedToken = encodeBase64Url(header) + '.' + encodeBase64Url(payload)
signature = HMAC-SHA256(unsignedToken, SECRET_KEY)
token = unsignedToken + '.' + encodeBase64Url(signature)
```

Причина, почему ***JWT*** используются — **только** проверка, что данные были действительно отправлены ранее авторизованным источником. ***JWT***  **НЕ** скрывает и не шифрует данные

- Плюсы:
	- JWT может хранить роли пользователя
	- быстро проверив подпись, бэк может доверять инф. токена

- Минусы
	- Лаг в применении. Нельзя быстро ограничить пользователя (настраиваемое время жизни токена)