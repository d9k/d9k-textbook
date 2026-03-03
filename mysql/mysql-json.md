# MySQL JSON

## What is MySQL JSON Data Type? - GeeksforGeeks

https://www.geeksforgeeks.org/mysql/what-is-mysql-json-data-type/

```sql
CREATE TABLE products (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    details JSON
);

INSERT INTO products (id, name, details)
VALUES (1, 'Product A', '{"price": 10, "category": "Electronics"}');

SELECT name, details->'$.price' AS price
FROM products
WHERE details->'$.category' = 'Electronics';
```

Дмитрий Горяинов: Примерно как ...с 5.6 поддержка хронимых процедур - она есть, но под нагрузкой ложится. У Постгри реально лучшая поддержка json у MySQL более менее с 8 ой версии.

## JSONB vs JSON: the Postgres/MySQL showdown that actually matters | by <devtips/> | Medium

https://medium.com/@dev_tips/jsonb-vs-json-the-postgres-mysql-showdown-that-actually-matters-e28db3db3942

Get and set:

```sql
SELECT JSON_EXTRACT(data, '$.user.name')
FROM events
WHERE JSON_EXTRACT(data, '$.status') = 'active';

UPDATE events
SET data = JSON_SET(data, '$.status', 'inactive')
WHERE id = 42;
```

Adding index:

```sql
ALTER TABLE events
ADD COLUMN status VARCHAR(20)
    GENERATED ALWAYS AS (JSON_UNQUOTE(JSON_EXTRACT(data, '$.status'))) STORED,
ADD INDEX idx_status (status);

SELECT * FROM events WHERE status = 'active';
```

### vs PSQL: Benchmarks: OLTP vs analytics

Performance isn’t about “who’s faster,” it’s about faster at what.

OLTP (transactions, frequent reads/writes):

- MySQL + InnoDB usually wins simple queries, generated columns, predictable response times.
- Postgres can keep up with GIN indexes, but MVCC + autovacuum adds overhead.
- Analytics (dashboards, filters, big scans):

Postgres shines GIN/GiST indexes + parallel queries handle JSON filtering like a champ.

- MySQL can do it, but JSON functions bog down on large datasets.
- MySQL for heavy OLTP with JSON sprinkled in. Postgres for analytics or complex JSON queries.

## MySQL :: MySQL 8.4 Reference Manual :: 13.5 The JSON Data Type

https://dev.mysql.com/doc/refman/8.4/en/json.html