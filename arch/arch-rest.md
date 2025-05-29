# Architecture: REST

## What is REST

***RE***resentational ***S***tate ***T***ransfer - передача „самоописываемого“ состояния» — архитектурный стиль взаимодействия компонентов распределённого приложения в сети. REST является альтернативой ***RPC***.

REST — набор правил проектирования архитектуры ПО, обеспечивающих простоту интерфейса, отказоустойчивость, лёгкость мастштабирования и обмена данными.

Большинство реализаций REST используют такие стандарты, как HTTP, URL, JSON и, реже, XML.

- [REST — Википедия](https://ru.wikipedia.org/wiki/REST)

## Требования к REST

- :newspaper: [А ваша служба является RESTful? Все что необходимо/обязательно знать про веб службы и REST | TipTep | Хабр](https://habr.com/ru/articles/319984/)

- Отсутствие состояния - никакая информация о состоянии клиента на сервере не хранится
- Возможность кэширования
- Модель клиент-сервер
- Слои - клиент не должен быть способен определить, взаимодействует ли он напрямую с сервером или же с промежуточным узлом. Например, если вы вызывайте службу PayPal а он в свою очередь вызывает службу Visa, вы о вызове службы Visa ничего не должны знать.
- Единообразие интерфейса. **«Самоописываемые» сообщения** - Каждое сообщение содержит достаточно информации для понимания, каким обработчиком сообщения (parser) для извлечения данных его обрабатывать. Например, как MIME-тип.

## OData

- [Open Data Protocol - Wikipedia](https://en.wikipedia.org/wiki/Open_Data_Protocol)

An open protocol that allows the creation and consumption of queryable and interoperable Web service APIs in a standard way. Microsoft initiated OData in 2007

`http://host/service/` - OData service root. Returns ***the service document*** which lists entity sets, functions, and singletons that can be retrieved.

`http://host/service/$metadata` - [static](https://github.com/OData/odata.net/issues/181) XML document describing the types, sets, functions and actions understood by the OData service

OData uses the ***HTTP verbs*** to indicate the operations on the resources: `GET` (select), `POST` (insert new), `PUT` (upsert?, whole), `PATCH` (update, some fields), `DELETE`.

URLs requested from an OData endpoint may include query options as [URL query string](https://en.wikipedia.org/wiki/Query_string). Each query parameter name must be prefixed with `$` sign:

```
OData/Products?$top=2&$orderby=Name
OData/Products?$filter=Price lt 10.00 and startswith(Name,'M')
```

### See also

- [Understand OData in 6 steps | OData getting started](https://www.odata.org/getting-started/understand-odata-in-6-steps/)
	- Relating resources, Invoking a function...

## Критика

- :newspaper: [RESTful API — большая ложь | Shakirok | Хабр](https://habr.com/ru/articles/265845/), 2015

RESTful API в дребезги разбивает один из фундаментальных законов о хорошей связи: содержимое сообщения должно быть абсолютно независимо от канала передачи. Их смешивание — это путь к сплошной путанице.

Постоянное переплетение HTTP протокола и передаваемой информации полностью лишает нас возможности переноса RESTful API на другие каналы связи.

Портирование RESTfulAPI с HTTP на какой-либо другой протокол передачи данных требует полного распутывания и реструктуризации информации из семи разных точек, о которых мы говорили ранее:

- Метод HTTP запроса, например, POST
- Адрес запроса, например, /object/list
- Метод, который мы на самом деле подразумеваем (в теле запроса), например, DELETE
- Собственно, тело запроса, например, данные из формы
- Код ответа, например, 200 ОК
- Код, который мы подразумевали (в теле ответа), например, 206 Partial Content
- Собственно, тело ответа

JSON-pure API справляется с большинством проблем, которые мы только что рассмотрели.

- Использует только один метод для передачи данных — обычно POST для HTTP и SEND в случае использования Web Sockets
- Механизм передачи и содержимое запроса полностью независимы. Все ошибки, предупреждения и данные передаются в теле запроса, в формате JSON
- Используется лишь один код ответа, чтобы подтвердить успешную передачу, обычно это 200 ОК
- Механизм передачи и содержимое ответа полностью независимы. Все ошибки, предупреждения и данные передаются в теле ответа, в формате JSON
- Гораздо проще дебажить, ведь все данные находятся в одном месте в легко-читаемом формате JSON
- Легко перенести на любой канал связи, например, HTTP/S, WebSockets, XMPP, telnet, SFTP, SCP, or SSH


## REST idempotent methods

- :speech_balloon: [http - Is REST DELETE really idempotent? | SO](https://stackoverflow.com/questions/4088350/is-rest-delete-really-idempotent)

Idempotent: GET, PUT, DELETE, HEAD, OPTIONS and TRACE.

POST, PATCH are not

Идемпоте́нтность («равносильность» от лат. idem «тот же самый» + potens «способный») — свойство объекта или операции при повторном применении операции к объекту давать тот же результат, что и при первом.

Idempotence refers only to the state of the system after the request has completed 1st, 2nd, n-th time.
