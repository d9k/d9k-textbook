# Databases: practices

Designing a database is not a deterministic task; two database designers may follow all the rules and normalization principles for a given problem, and in most cases they will generate different data layouts.

- [Database Design Bad Practices | Toptal®](https://www.toptal.com/database/database-design-bad-practices)

## Singular vs. plural names

[sql - Table Naming Dilemma: Singular vs. Plural Names | SO](https://stackoverflow.com/questions/338156/table-naming-dilemma-singular-vs-plural-names)

Singular:

- good for ORM, ERD
- PSQL functions arguments types
- [sql more readable](https://stackoverflow.com/a/716269)

```sql
SELECT Customer.Name, Customer.Address FROM Customer WHERE Customer.Name > "def"
```

vs

```sql
SELECT Customers.Name, Customers.Address FROM Customers WHERE Customers.Name > "def"
```

## Naming conventions

- If sticking to the simple primary key rule (single integer auto generated), name it `id` in every table.
- If joining to another table, define the necessary foreign key as an integer, named `id` preceded by the name of the joined table (e.g., `author_id`).
- If naming constraints, use a prefix describing the constraint (e.g., `pk_` or `fk_`, followed by the name of the table or tables involved.
- To name indexes, use the prefix `idx` followed by the table name and the column or columns of the index. Also, use `unique` as a prefix or suffix if the index is unique, and underscores where necessary.
