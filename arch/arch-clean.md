# Architecture: clean

- https://www.geeksforgeeks.org/design-patterns-architecture/#hexagonal-architecture-ports-and-adapters
	- 11 arch pattern with visual diagrams

## Predecessors

### Screaming Architecture / Uncle Bob

- https://blog.cleancoder.com/uncle-bob/2011/09/30/Screaming-Architecture.html

Directory structure must ***represent project***, not framework. When you look at the top level directory structure, and the source files in the highest level package; do they scream: Health Care System, or Accounting System, or Inventory Management System? Or do they scream: Rails, or Spring/Hibernate, or ASP?

***Defer*** as building architect ensures that the homeowner can decide about materials _later_, after the plans ensure that the use cases are met. A good software architecture allows decisions about frameworks, databases, web-servers, and other environmental issues and tools, to be deferred and delayed. You should be able to unit-test all those use cases without any of the frameworks, web servers, database running in order to run your tests. New programmers should be able to learn all the use cases of the system, and still not know how the system is delivered. They may come to you and say: “We see some things that look sorta like models, but where are the views and controllers”, and you should say: “Oh, those are details that needn’t concern you at the moment, we’ll show them to you later.”

### The Onion Architecture / Jeff. Palermo

- https://jeffreypalermo.com/2008/07/the-onion-architecture-part-1/

- independence of infrastructure
- Traditional layere arch: (->: depends on) UI -> Business logic -> Data, all layers may depend on Infrastracure
- Onion (Starting with "|" - same level, parallel. Central is below, external is above):
	- Outer ring
		- | Infrastructure
			- | DB
			- | Files
			- | Web Services
		- | UI
		- | Tests
	- Application core - Only the interface is in the application core
		- Application Services
		- Domain Services
		- Domain Model - is only coupled to itself
	- All code can depend on layers more central (below), but code cannot depend on layers further out from the core (above). All coupling is toward the center (below). Onion architecture is biased toward OOP and relies heavily on Dependency Inversion principle.
	- Infrastructure: historically, the industry has modified data access techniques at least every 3 years; Therefore, we can count on needing to modify data access 3 years from now for any healthy, long-lived systems that’s mission-critical to the business. If coupling prevents easily upgrading parts of the system We often don’t keep systems up-to-date.

## Ready for changes with Hexagonal Architecture | Netflix TechBlog, 2020

https://netflixtechblog.com/ready-for-changes-with-hexagonal-architecture-b315ec967749

![Hexagonal architecture|400](https://raw.githubusercontent.com/d9k/d9k-textbook-assets/main/arch/arch-clean/arch-hexagonal.png)

   http / queue / gRPC API / REST API
-> transport layer / data sources
-> interactors / repositories
-> entities

The need to swap data sources came earlier than we expected — we suddenly hit a read constraint with the monolith and needed to switch a certain read for one entity to a newer microservice exposed over a GraphQL aggregation layer. Both the microservice and the monolith were kept in sync and had the same data, reading from one service or the other produced the same results.

We managed to transfer reads from a JSON API to a GraphQL data source within 2 hours.

The main reason we were able to pull it off so fast was due to the Hexagonal architecture. We didn’t let any persistence specifics leak into our business logic.

## Hexagonal Architecture – What Is It? Why Use It?

https://www.happycoders.eu/software-craftsmanship/hexagonal-architecture/


![Hexagonal architecture|500](https://raw.githubusercontent.com/d9k/d9k-textbook-assets/main/arch/arch-clean/arch-hexagonal-with-control-flow.png)

## 5. Hexagonal Architecture (Ports and Adapters) | Software Architectural Patterns in System Design - GeeksforGeeks

- https://www.geeksforgeeks.org/design-patterns-architecture/

The Ports and Adapters pattern, another name for Hexagonal Architecture, is a software design methodology that seeks to provide loosely linked application components. Isolating an application's essential logic (the "inside") from external systems or interfaces (the "outside") is the idea. This is accomplished by drawing distinct lines between the main logic of the application and the external systems—like databases, web services, user interfaces, or messaging systems—that communicate with it.

## Hexagonal architecture (software) - Wikipedia

- https://en.wikipedia.org/wiki/Hexagonal_architecture_(software)



## About the Clean Architecture

- [The Clean Architecture / Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- All predecessors have the same objective, which is the ***separation of concerns***.
	- They all achieve this separation by dividing the software into ***layers***.
		- Each has at least one layer for ***business rules***
		- and another for ***interfaces***
	- Each is ***independent of frameworks***, ***testable*** \[in isolation\], ***parts can be replaced*** in isolation (UI, DB).
	- Business rules simply don’t know anything at all about the outside world (***independent of any external agency***).
- The outer circles are mechanisms. The inner circles are policies. Dependency inversion: nothing in an inner circle can know anything at all about something in an outer circle. Data formats used in an outer circle should not be used by an inner circle,

## Layers

top (internal) layers not affected by bottom (outer) \[know nothing about bottom layers\]

- ***Entities***: general and high-level business rules, least likely to change. Data structures definitions and algorithms. Entities could be used by many different applications in the enterprise. If you just writing a single application, then these entities are the business objects of the application.
- ***Use cases***: application specific business rules. These ***use cases*** orchestrate the flow of data to and from the entities, and direct those entities to use their _enterprise wide_ business rules to achieve the goals of the use case.
- ***Interface Adapters*** - Presenters, Views, and Controllers - convert data between formats for entities / use cases and *external agency* formats.
- ***Frameworks and Drivers*** - adapters glue code that communicates to the next circle inwards.

## Peculiarities

Note the flow of control. It begins in the controller, moves through the use case, and then winds up executing in the presenter.

Typically the data that crosses the boundaries is simple data structures. You can use basic structs or simple Data Transfer objects if you like.

## Заблуждения Clean Architecture

https://habr.com/ru/companies/mobileup/articles/335382/

- Entity это не POJO / DTO, а  объекты с методами или набором структур и функций.
- Interactor – объект, который реализует сценарии использования (use case), оперирующая бизнес-объектами (Entities).
- Use case – это детализация, описание действия, которое может совершить пользователь системы.

```
Use case: Create Order

Data: CustomerId, CustomerContactInfo, ShipmentDestination, ShipmentMechanism, PaymentInformation

Primary Course:
1. Order clerk issues "Create Order" command with above data.
2. System validates all data.
3. System creates order and determines order-id.
4. System delivers order-id to clerk.

Exception Course: Validation Error

l. System delivers error message to clerk
```

