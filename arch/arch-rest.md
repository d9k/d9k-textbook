# Architecture: REST

## What is REST

***RE***resentational ***S***tate ***T***ransfer - передача „самоописываемого“ состояния» — архитектурный стиль взаимодействия компонентов распределённого приложения в сети. REST является альтернативой ***RPC***.

REST — набор правил проектирования архитектуры ПО, обеспечивающих простоту интерфейса, отказоустойчивость, лёгкость мастштабирования и обмена данными.

Большинство реализаций REST используют такие стандарты, как HTTP, URL, JSON и, реже, XML.

- [REST — Википедия](https://ru.wikipedia.org/wiki/REST)

## Требования к REST

- Отсутствие состояния - никакая информация о состоянии клиента на сервере не хранится
- Возможность кэширования
- Модель клиент-сервер
- Слои - клиент не должен быть способен определить, взаимодействует ли он напрямую с сервером или же с промежуточным узлом
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