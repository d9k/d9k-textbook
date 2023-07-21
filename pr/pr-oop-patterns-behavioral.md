# Шаблоны ООП-проектирования: поведенческие

Обычно превращают отдельные поведения в объекты.

## Chain of responsibility

Цепь обработчиков: обработчику передаётся состояние и функция запуска следующего обработчика. Обработчик может вызвать следующий, а может прервать выполнение или выдать ошибку.

`Handler: next: Handler, setNext(h: IHandler), handle(request)`

```
hLog = new HandlerLog()
hAuth = new HandlerAuth()
hCache = new HandlerCache()
hLog.setNext(hAuth)
hAuth.setNext(hCache)
hLog.handle(request)
```

[refactoring.guru](https://refactoring.guru/ru/design-patterns/chain-of-responsibility)

## Command

`Command: execute()`. Опционально может быть `undo()`.

`Invoker: command, setCommand(command), executeCommand()`

- [refactoring.guru](https://refactoring.guru/ru/design-patterns/command)

Отделить бизнес-логику от интерфейса.

```
const saveCommand = new SaveCommand();

button.setCommand(saveCommand)
menuItem.setCommand(saveCommand)
customkeyboardShortcut.setCommand(saveCommand)
```

## Iterator

`Iterator(collection): currentElement, getNext(), hasMore()`

`Iterator <|-- TreeDepthFirstIterator, TreeBreadthFirstIterator`

Ещё пример:

`FacebookApiClient: createFriendsIterator(profileId), createCowokersIterator(profileId)`

[refactoring.guru](https://refactoring.guru/ru/design-patterns/iterator)

## Intermediary, Controller, Mediator (Посредник)

Обработка событий и реагирование на них. Уменьшает связи между классами, изолируя в себе их.

## Memento (Хранитель, Снимок)

Паттерн Снимок поручает создание копии состояния объекта самому объекту, который этим состоянием владеет. Снимок — простой неизменяемый объект данных.

`Editor: hisrory, markeSnapshot(), restore(snapshot)`

Отличия от "Prototype": Прототип клонирует сам объект, Снимок использует отдельный класс для хранения состояния.

## Observer (Наблюдатель, Издатель-Подписчик, Слушатель)

Механизм подписки, позволяющий любому заранее неизвестному количеству объектов следить и реагировать на события, происходящие в других заранее неизвестных объектах.

```
Editor {
  // . . . . .
  openFile(path) {
    events.notify("open", path)
  }
  // . . . . .
}

editor.events.subscribe("open", logger)
editor.events.subscribe('save', emailAlerts)
```

## State (Состояние)

Конечный автомат. Пошаговая форма, состояние публикации.

`MobilePhoneNotificationProile: alert(mobilePhone)`
`MobilePhoneNotificationProile <|-- ProfileLoud, ProfileVibration`
`MobilePhone: notificationProfile, setNotificationProfile(n), alert()`
`MobilePhone.alert()`: `this.notificationProfile.alert(this)`

- [refactoring.guru](https://refactoring.guru/ru/design-patterns/state)
- [State Design Pattern - GeeksforGeeks](https://www.geeksforgeeks.org/state-design-pattern/)

## Strategy (Стратегия)

- [refactoring.guru](https://refactoring.guru/ru/design-patterns/strategy)

`RouteStrategy: buildRoute(a,b)`
`RouteStrategy <|-- TaxiRouteStrategy, BusRouteStrategy, WalkRouteStrategy`
`Navigator: routeStrategy, setStrategy(s), buildRoute(a, b)`
``

- Отличие от State: конкретные Состояния могут переключать Состояние. Стратегия ничего не знает об объекте, который её включает в себя и применяет

## Template Method (Шаблонный метод)

Разбиваем большой метод на составные части и переопределяем только изменяющиеся из них.

Минусы: вы жёстко ограничены скелетом существующего алгоритма.

## Visitor (Посетитель)

Когда мы не можем или не хотим изменять исходные классы. Допустим, мы хотим подгружать в рантайме поведение из плагинов.

Двойная диспетчеризация:

Например, нам нужно отправлять разную страховую рекламу в зависимости от типа получателя.

`ITarget: acceptVisitor(v)`

`ITarget <|-- Industry, Person, Bank`

```
InsuranceAdlVisitor extends TargetVisitor {
  doForPerson() { sendEmailTemplate(MedicalInsuranceAdTemplate) }
  doForIndustry() { sendEmailTemplate(FireInsuranceAdTemplate) }
  doForBank() { sendEmailTemplate(RobberyInsuranceAdTemplate) }
}

class Industry {
  acceptVisitor (v) { v.doForIndustry(this); }
}

// . . . . .

addressee.acceptVisitor(insuranceAdVisitor)
```

либо перегрузка метода

```
EnsuranceAdVisitor {
  do(target: Person) { /* . . . */ }
  do(target: Industry) { /* . . . */ }
  // . . . . .
}
```