# Паттерны ООП: порождающие

[<- Назад](./pr-oop-patterns.md)

## Builder (строитель)

Допустим, рассчитать стоимость домов с различными типовыми элементами.
```
houseBuilder.buildWalls('stone').buildDoors('metal').buildRoof().buildGarage().getResult()
```
Для сложных случаев "Распорядитель"/"директор" - позволяет скрыть детали "строителя".

- Источник: [refactoring.guru](https://refactoring.guru/ru/design-patterns/builder)

## Fabric method (фабричный метод) / Virtual constructor

`depo.deliver()` внутри вызывает `depo.getTransport()`, которое создаёт объекты разных типов.

`ScooterDepo|TaxiDepo|CopterDepo` наследуются от `Depo` и создают `Taxi|Scooter|Copter`.

- Минусы: для каждого класса продукта надо создать параллельный класс создателя.
- Источник: [Factory Method Pattern / Хабр](https://habr.com/ru/articles/556512/)

## Abstract factory (абстрактная фабрика)

`Chair <|-- VictorianChair / ModernChair`

`FurnitureFactory <|-- VictorianFurnitureFacory / ModernFurnitureFactory`
`FurnitureFactory: createChair(), createSofa(), createDresser()`

- Минусы: требует наличия всех типов продукции в каждой вариации.
- Источник: [refactoring.guru](https://refactoring.guru/ru/design-patterns/abstract-factory)

## Prototype (Прототип) / Clone

Метод `.clone()`,  который копирует объект со всеми внутренними полями.

- Источник: [refactoring.guru](https://refactoring.guru/ru/design-patterns/prototype)

## Singletone (Одиночка)

- Гарантировать единственность какого-то общего ресурса, например, базы данных.

- Источник: [refactoring.guru](https://refactoring.guru/ru/design-patterns/singleton))