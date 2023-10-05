# Architecture: clean

## Predecessors

- [Screaming Architecture / Uncle Bob](https://blog.cleancoder.com/uncle-bob/2011/09/30/Screaming-Architecture.html)
	- Directory structure must ***represent project***, not framework. When you look at the top level directory structure, and the source files in the highest level package; do they scream: Health Care System, or Accounting System, or Inventory Management System? Or do they scream: Rails, or Spring/Hibernate, or ASP?
	- ***Defer*** as building architect ensures that the homeowner can decide about materials _later_, after the plans ensure that the use cases are met. A good software architecture allows decisions about frameworks, databases, web-servers, and other environmental issues and tools, to be deferred and delayed. You should be able to unit-test all those use cases without any of the frameworks, web servers, database running in order to run your tests. New programmers should be able to learn all the use cases of the system, and still not know how the system is delivered. They may come to you and say: “We see some things that look sorta like models, but where are the views and controllers”, and you should say: “Oh, those are details that needn’t concern you at the moment, we’ll show them to you later.”
- [The Onion Architecture / Jeff. Palermo](https://jeffreypalermo.com/2008/07/the-onion-architecture-part-1/)
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
## About

- [The Clean Architecture / Uncle Bob](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- All predecessors have the same objective, which is the ***separation of concerns***. They all achieve this separation by dividing the software into layers. Each has at least one layer for business rules, and another for interfaces. Each is ***independent of frameworks***, ***testable*** \[in isolation\], ****parts can be replaced*** in isolation (UI, DB). Your business rules simply don’t know anything at all about the outside world (***independent of any external agency***).
- The outer circles are mechanisms. The inner circles are policies. Dependency inversion: nothing in an inner circle can know anything at all about something in an outer circle.