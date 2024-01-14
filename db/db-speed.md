# Database: speed optimisation

- [Database Design Bad Practices | Toptal®](https://www.toptal.com/database/database-design-bad-practices)

## Composite key

If your table with a composite primary key is expected to have millions of rows, the index controlling the composite key can grow up to a point where CRUD operation performance is very degraded. In that case, it is a lot better to use a simple integer ID primary key whose index will be compact enough and establish the necessary DBE constraints to maintain uniqueness.

## Overindexing

Performance of SELECTs improves but INSERTs, UPDATEs, and DELETEs drop.

Also, index efficiency depends on the column type; indexes on INT columns show the best possible performance, but indexes on VARCHAR, DATE or DECIMAL (if it ever makes sense) are not as efficient.