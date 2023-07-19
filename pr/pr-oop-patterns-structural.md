# Паттерны ООП: структурные

[<- Назад](./pr-oop-patterns.md)

## Adapter / Wrapper

`StockQuotesClient` работает с `xml`, реализует `IStockQuotesClient`.
`StockQuotesClientXmlToJsonAdapter` принимает в конструктор `adaptee: IStockQuotesClient` и сохраняет как поле. Методы имеют то же название, но другую сигнатуру, например, `jsonObject` вместо `xmlObject` на входе и выходе.

[refactoring.guru](https://refactoring.guru/ru/design-patterns/adapter)