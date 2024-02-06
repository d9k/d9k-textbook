# PostgreSQL: inheritance

PSQL 12+

- [Inheritance | PostgreSQL Documentation](https://www.postgresql.org/docs/current/tutorial-inheritance.html)

## Limitations

All these constraints are not propagated to child tables. As for triggers, you can use them on child tables as you wrote. And you could use a trigger on the parent table that would decide in which of the child tables it should put data on an **insert** query (or retrieve on **select**) based on some conditions

- ["Abstract" table in PostgreSQL (inheritance) | SO](https://stackoverflow.com/questions/29366515/abstract-table-in-postgresql-inheritance)

A serious limitation of the inheritance feature is that indexes (including unique constraints) and foreign key constraints only apply to single tables, not to their inheritance children.

- [Caveats | Inheritance | PostgreSQL Documentation](https://www.postgresql.org/docs/current/ddl-inherit.html#DDL-INHERIT-CAVEATS)

Nobody's successfully implemented unique indexes that span inherited tables well enough for a patch adding support to be accepted into PostgreSQL yet.

[Foreign keys + table inheritance in PostgreSQL? - Stack Overflow](https://stackoverflow.com/questions/24360312/foreign-keys-table-inheritance-in-postgresql/24361724#24361724)

## When use tables inheritance?

Partitioning, common columns

- [When to use inherited tables in PostgreSQL? | SO](https://stackoverflow.com/questions/3074535/when-to-use-inherited-tables-in-postgresql)