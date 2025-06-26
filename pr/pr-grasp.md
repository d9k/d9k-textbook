# Программирование: принципы GRASP

- :label: Separation of Concerns

General responsibility assignment software patterns — общие шаблоны распределения ответственностей для ПО;

Шаблоны GRASP являются скорее не паттернами проектирования (как GangOfFour'ские), а фундаментальными принципами распределения ответственности между классами.

От абстрактного к конкретному:
Принципы ООП -> GRASP -> Паттерны проектироваиня GoF

- [G.R.A.S.P шаблоны проектирования | Андрей Кузнецов | Дзен](https://dzen.ru/a/XvRCZf8NBzkeMJFQ)
- [GRASP — Википедия](https://ru.wikipedia.org/wiki/GRASP)
- [Шаблоны GRASP: Creator (создатель) / Хабр](https://habr.com/ru/companies/otus/articles/505618/)
- [Шаблоны GRASP: Information Expert (информационный эксперт) / Хабр](https://habr.com/ru/companies/otus/articles/491636/)
- [Шаблоны GRASP: Controller (контроллер) / Хабр](https://habr.com/ru/companies/otus/articles/507600/)
- [Шаблоны GRASP: Polymorphism, Pure Fabrication, Indirection, Protected Variations / Хабр](https://habr.com/ru/companies/otus/articles/521476/)

## Low coupling high cohesion, в чём разница?

- ![coupling vs cohesion|120](https://upload.wikimedia.org/wikipedia/commons/0/09/CouplingVsCohesion.svg)
- [Зацепление (программирование) — Википедия](https://ru.wikipedia.org/wiki/%D0%97%D0%B0%D1%86%D0%B5%D0%BF%D0%BB%D0%B5%D0%BD%D0%B8%D0%B5_(%D0%BF%D1%80%D0%BE%D0%B3%D1%80%D0%B0%D0%BC%D0%BC%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%B8%D0%B5))

### Loose coupling - низкая связность (должно быть)

Зацепление - степень взаимозависимости между программными модулями.

Типы:
- общие данные
- включение одного модуля в другой как составной части
- один модуль управляет другим
- патологическая: один программный модуль зависит от деталей внутренней реализации другого модуля или влияет на них.
- циклическая зависимость - не можем использовать классы по-отдельности

[Зацепление (программирование) — Википедия](https://ru.wikipedia.org/wiki/Зацепление_%28программирование%29))

### High cohesion - высокое зацепление

Связность - мера взаимосвязанности элементов внутри модуля.

Типы связности:

- Случайная - задачи модуля не имеют функциональной взаимосвязи друг с другом.
- Функциональная - задачи модуля вносят вклад в выполнение одной и той же функции.
- Логическая - модуль реализует логически сходные функции (например, одинаково обрабатывает разные типы входных данных).
- Последовательностная - выходные данные одной задачи модуля служат входным данными другой задаче модуля
- Временна́я - задачи модуля требуются для некоторой фазы выполнения программы (например, все задачи для инициализации).

[Связность (программирование) — Википедия](https://ru.wikipedia.org/wiki/Связность_%28программирование%29)

### Ещё по связности и сцеплению

- :newspaper: [Locality of behavior | dev.to](https://dev.to/ralphcone/new-hot-trend-locality-of-behavior-1g9k)
	- Cohesion is basically a measure of how code put in the same code unit is related.
	- Coupling is a measure of “how much other code will I have to change if I change X”.

## Примеры

- :newspaper: [Шаблоны GRASP: Low Coupling (низкая связанность) и High Cohesion (высокое зацепление) / Хабр](https://habr.com/ru/companies/otus/articles/505852/)
	- когда high coupling, нарушается SRP из SOLID
	- `Data` разделяем на `TemperatureData`, `TimeData`.
	- запах кода: префиксы

## Полиморфизм

Заменять конструкции switch на полиморфные классы. Проще подменять поведение.

## Protected Variations

Паттерн-цель, достигаемый соблюдением остальных паттернов: изменение одних элементов системы не должно влиять на другие.

## 5 ролей

### Controller

**Controller'у**. Controller — это объект, который отвечает за обработку системных событий. Отделяет реакцию на события от бизнес-логики. \[Можно добавить новый контроллер без изменения логики, например, к Web-интерфейсу добавить REST API, чат-бота или постинг по входящему email\]

В Controller'е удобно накапливать информацию о системных событиях (\[очередь?\]). Controller может содержать логирование, аутентификацию, авторизацию, кеширование, \[защиту от неправильного ввода\].

### Создатель (Creator)

Создавать экземпляры класса должен класс, которому они необходимы. Неправильно, когда `Client` создаёт и `Good` , и `Order`, и `OrderItem`.

### Indirection (интерфейс-посредник)

Если все классы вызывают друг друга через интерфейсы, то это приводит к возможности «выдрать» любой кусок из системы и переиспользовать его в другом месте, облегчить рефакторинг.

### Информационный эксперт

Информация должна обрабатываться там, где она содержится.

Например, вместо `Client.getOrderPrice()` должен быть `Order.getPrice()`.

### Pure Fabrication (искуственная сущность)

Для обеспечения low coupling и high cohesion может понадобиться синтезировать искуственную сущность, не имеющий аналогов в предметной области. Например, фасад к базе данных.

## Bonus: law of Demeter

- [Закон Деметры — Википедия](https://ru.wikipedia.org/wiki/Закон_Деметры)

Правило основывается на принципе наименьшего знания. Основной идеей является то, что объект должен иметь как можно меньше представления о структуре и свойствах чего угодно (включая собственные подкомпоненты).

Говоря упрощённо, каждый программный модуль:
- должен обладать ограниченным знанием о других модулях: знать о модулях, которые имеют «непосредственное» отношение к этому модулю;
- должен взаимодействовать только с известными ему модулями-«друзьями», не взаимодействовать с «незнакомцами»;
- обращаться только к непосредственным «друзьям».

ООП: Объект A не должен иметь возможность получить непосредственный доступ к объекту C, если у объекта A есть доступ к объекту B и у объекта B есть доступ к объекту C.

Многоярусная архитектура может также рассматриваться как пример реализации закона Деметры в программной системе. В такой архитектуре код каждого яруса может вызвать только код своего или низшего яруса. Вызов через ярус является нарушением многоярусной архитектуры.

## Bonus: Locality of behavior

### Locality of behavior / Rafal Stozek

- https://dev.to/ralphcone/new-hot-trend-locality-of-behavior-1g9k

\[Easiest antipattern to good locality is switch..case instead of polymorphism\]

The primary feature for easy maintenance is locality:
Locality is that characteristic of source code that enables a programmer to understand that source by looking at only a small portion of it.

It’s much easier to understand code which lives together and can be easily and quickly tracked than code where you need to jump around the whole codebase to piece the logic together.

Htmx helps locality

#### Separation of Concerns (SoC)

Separation of Concerns is an old technique where we separate computer system into distinct sections, where each addresses separate concerns.

#### Practical advice on code locality

- when your components / code is pretty simple - it’s usually better to be able to see everything at once
- but as the code - for a particular component / code unit grows more complex, at some point it is very useful to be able to understand business logic in isolation, without it being tangled with other concerns like templating or styling
- so start with something simple and when it grows more hard to understand, start separating those concerns in a way that make it easier to understand
- but when you separate these concerns to separate files - keep them close together so it’s still easy to understand whole thing