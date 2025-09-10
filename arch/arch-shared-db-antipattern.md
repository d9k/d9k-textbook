# Architecture: shared database antipattern

Sharing database among apps.

:speech_balloon: [enterprise architecture - Is there any recognized pattern supporting or discouraging the access to the same database from multiple applications? - Software Engineering Stack Exchange](https://softwareengineering.stackexchange.com/questions/419543/is-there-any-recognized-pattern-supporting-or-discouraging-the-access-to-the-sam)

A database is an implementation detail. You now exposed it to other applications. Change database for one app, other affected.
