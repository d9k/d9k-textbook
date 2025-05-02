# Architecture: microservices

- [Microservice Trade-Offs](https://martinfowler.com/articles/microservice-trade-offs.html)

## Microservices advantages

- Since each microservice runs independently of the others, it’s easy to add, remove, update, and scale individual microservices without disrupting other services. You can focus on only necessary services in case of an increased load.
- When developing microservices, developers can use any programming language and any framework for each new microservice.
- Improved fault tolerance. If one microservice fails, the other services can keep working, leaving the app mostly unaffected.

## Microservices disadvantages

- Communication between microservices can be complex. If you have multiple microservices, you might need to write extra code to maintain smooth communication and avoid disruptions.
- Large infrastracture
- Each service needs to be tested independently and verified before the application as a whole can be tested.

## Links

 - https://tyk.io/blog/building-and-managing-graphql-microservices-with-apollo-and-tyk/

## Выделение микросервиса

- :newspaper: [Паттерн микросервиса Strangler | Блог Serverspace](https://serverspace.ru/about/blog/pattern-mikroservisa-strangler/?utm_source=google.com&utm_medium=organic&utm_campaign=google.com&utm_referrer=google.com)

В монолите выделяются отдельные сервисы, потом по одному переносятся в микросервисы (отделение кода микросервиса и базы микросервиса). Вызовы заменяются http-запросами.