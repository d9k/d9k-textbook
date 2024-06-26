# 1C: REST-доступ

## Установка и настройка REST-доступа

- [ODATA пишет «Сущность не найдена» \[Решено\]](https://forum.mista.ru/topic.php?id=739566)
	- [Редактирование состава интерфейса OData для 1С 8.3.5](https://infostart.ru/1c/tools/297325/)
- [Использование REST web-сервисов в "1C:Предприятии 8". Личный опыт / infostart](https://infostart.ru/1c/articles/565435/)
	- _"По умолчанию после публикации объекты конфигурации не доступны. Прежде чем обращаться к ним, необходимо разрешить доступ, например с помощью типовой обработки "Настройка автоматического REST сервиса". В обработке можно задать отдельного пользователя REST сервиса"_
		- Настройка автоматического REST-сервиса ?
		- Типовая обработка?
- 1С OData получить описание базы
	- [Работа с 1С через протокол OData](https://infostart.ru/1c/articles/1570140/)
	- получение структуры метаданных
- [Автоматический REST-сервис в «1С:Предприятии». OData. Пример работы из Jscript/AJAX | open budget](https://open-budget.ru/public/305854/)
- [Практика доступа в базу 1С через протокол oData. Чтение данных | infostart](https://infostart.ru/1c/articles/711302/)
	- `C:\inetpub\wwwroot\DemoHRM\`
	- http://127.0.0.1/DemoHRM
	- :rotating_light: Обработчик "1C Web-service Extension" содержит поврежденный модуль "IsapiModule" в списке модулей
		- [Публикация информационных баз на веб-сервере IIS под Windows с использованием шифрования (HTTPS) :: Инструкции :: Методическая поддержка для разработчиков и администраторов 1С:Предприятия 8](https://its.1c.ru/db/metod8dev/content/5977/hdoc)
		- [Публикация баз данных «1С:Предприятия» 8.3 на веб-сервере IIS в Microsoft Windows Server 2008/2012 | Tavalik.ru](https://tavalik.ru/nastrojka-veb-dostupa-k-bd-1spredpriyatie-na-iis/#p7)
- [Как взаимодействовать с 1С:Предприятие через REST интерфейс? — Хабр Q&A](https://qna.habr.com/q/1323250
	- _включить OData на стороне 1С и опубликовать ее на веб-сервере. Второй вариант - самому написать в 1С http-сервисы, которые бы реализовывали необходимое взаимодействие._
- Вариант с минимумом телодвижений: [Практика доступа в базу 1С через протокол oData. Чтение данных | infostart](https://infostart.ru/1c/articles/711302/)
	- Начиная с версии платформы 8.3.5 появилась возможность предоставить доступ к данным через автоматический REST-интерфейс на основе протокола OData v.3.0. Ограничение: необходимо установить веб-сервер и модуль расширения веб-сервера из поставки платформы.
	- Начиная с версии платформы 8.3.6 появился механизм расширений, который позволяет "пристегнуть" новую функциональность без внесения изменений в основную конфигурацию. В числе новой функциональности есть интересные нам WEB- и HTTP-сервисы. Начиная с версии платформы 8.3.11 стала доступной возможность расширения структуры таблиц  базы данных (добавление новых реквизитов для хранения служебных данных в целях интеграции). Ограничение: необходимо наличие программиста, который разработает расширение и будет следить за его работоспособностью при обновлениях; для сервисов необходимо установить веб-сервер и модуль расширения веб-сервера из поставки платформы.

## Пример URL

- Сервисный документ:
	- `http://127.0.0.1:8888/InfoBase1/odata/standard.odata?$format=json`

- XML-документ метаданных:
	- `http://127.0.0.1:8888/InfoBase1/odata/standard.odata/$metadata`

- Запрос сущности:
	- `http://127.0.0.1:8888/InfoBase1/odata/standard.odata/Catalog_Организации?$format=json`

## Префикс сущностей в REST URL

`/${СУЩНОСТЬ}_${ИМЯ}`

|**Объект конфигурации**|**Префикс имени в** **URL**|
|---|---|
|Справочник|Catalog|
|Документ|Document|
|Журнал документов|DocumentJournal|
|Константа|Constant|
|План обмена|ExchangePlan|
|План счетов|ChartOfAccounts|
|План видов расчета|ChartOfCalculationTypes|
|План видов характеристик|ChartOfCharacteristicTypes|
|Регистр сведений|InformationRegister|
|Регистр накопления|AccumulationRegister|
|Регистр расчета|CalculationRegister|
|Регистр бухгалтерии|AccountingRegister|
|Бизнес-процесс|BusinessProcess|
|Задача|Task|


## Параметры обращения к ресурсам

- [Работа с 1С через протокол OData | infostart](https://infostart.ru/1c/articles/1570140/)
	- коды ошибок
- [Настройка odata в 1с | varebux](https://varebux.ru/nastroyka-odata-v-1s/)
- [REST интерфейс и HTTP запросы в примерах | master1c8](https://master1c8.ru/platforma-1s-predpriyatie-8/rukovodstvo-razrabottchika/glava-17-mehanizm-internet-servisov/4036/)
- [Кратко об OData / AshBlade / Хабр](https://habr.com/ru/articles/678614/)

После формирования имени ресурса нужно определить параметры обращения к ресурсу, например, `?$filter=_Значение_&$format=json&$select=Ref_Key`.

- `$select` — `SELECT` вернуть только эти поля (`Ref_Key,ИНН,НаименованиеПолное`)
- `$filter` — `WHERE` отбор при получении данных (`Наименование eq 'Главный'`, `Цена ge 10`)
- `$format` — `JOIN` указывает формат возвращаемых данных (`json`),
- `$top` — `TAKE` ограничение количества возвращаемых записей
- `$skip` — `SKIP` / `OFFSET` убирает из результата запроса указанное количество записей
- `$count` — `COUNT`, возвращает количество записей в выборке запроса
- `$inlinecount=allpage(=none)` — добавляет в результат запроса информацию о количестве записей
- `$orderby` — `ORDER BY` сортировка результата запроса (`<Реквизит1> asc, <Реквизит2> desc`)
- `alloweOnly` — только разрешенные (используется без знака `$`).

