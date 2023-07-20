# Паттерны ООП: структурные

[<- Назад](./pr-oop-patterns.md)

## Adapter / Wrapper

`StockQuotesClient` работает с `xml`, реализует `IStockQuotesClient`.
`StockQuotesClientXmlToJsonAdapter` принимает в конструктор `adaptee: IStockQuotesClient` и сохраняет как поле. Методы имеют то же название, но другую сигнатуру, например, `JsonObject` вместо `XmlObject` на входе и выходе методов.

[refactoring.guru](https://refactoring.guru/ru/design-patterns/adapter)

## Bridge (Мост)

`BaseEntity: id, name, ...`
`BaseEntity <|-- Student | Teacher`.
`StorageRepository: store()`
`StorageRepository <|-- FileRepository, DatabaseRepository`
`StudentStorageManager, TeacherStorageManager` с конструктором `(repo: StorageRepository)`
`StudentStorageManager, TeacherStorageManager` в методе `save()` использует `repo.store(entity)`, осуществляя нужные доп. проверки.

- [refactoring.guru](https://refactoring.guru/ru/design-patterns/bridge)
- [All about bridge design pattern in java with real life example](https://stacktraceguru.com/bridge-design-pattern/)

## Composite (Компоновщик / Дерево)

`Graphic: x, y, draw()`
`Graphic <|-- Dot, Circle, CompoundGraphic`

[refactoring.guru](https://refactoring.guru/ru/design-patterns/composite)

## Decorator / Wrapper (Обёртка)

`IDataSource: readData(): data, writeData(data)`
`IDataSource <|-- FileDataSource(path), DataSourceDecorator(source: dataSource)`
`DataSourceDecorator <|-- EncryptionDecorator, CompressionDecorator`

`new CompressionDecorator(new EncryptionDecorator(new FileDataSource(path)))`

## Facade

Обеспечиваем паттерн GRASP low coupling - низкое зацепление между программными модулями.

Предоставляем минимально необходимый высокоуровневый интерфейс для сложной подсистемы.

## Flyweight (Приспособленец, кэш)

Устранить дублирование данных в памяти. Например, тысячи снарядов `Particle` в игре, каждый хранит дублирующиеся `sprite`. Выносим повторяющиеся неизменяемые спрайты в `ParticleSprite: sprite, color, draw()` и ссылаемся на них. Поля легковеса нельзя менять.

## Proxy (Заместитель)

`DB: query(), createConnection()`
`DBProxy(db: DB): query()`

Заместитель базы данных - такой же метод `query()`, но при первом вызове проводит инициализацию (устанавливает соединение) и через время отключает соединение.

`YoutubeClient: downloadVideo(url)`
`CachedYoutubeClient`
`CachedYoutubeClient.downloadVideo(url)` кэширует видео.

Отличие от decorator: оба добавляют функционал, но decorator расширяет интерфейс, а proxy может сокращать. Proxy может самостоятельно создавать оборачиваемый объект, а в decorator его всегда нужно передавать. Proxy сосредоточен на управлении доступом.

Добавление проверка прав доступа, логирование, кэширование.

[oop - Differences between Proxy and Decorator Pattern - Stack Overflow](https://abapblog.github.io/questions/18618779/differences-between-proxy-and-decorator-pattern.html)