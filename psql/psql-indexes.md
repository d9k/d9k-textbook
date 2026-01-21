# PostgreSQL: indexes

[JSONB vs JSON: the Postgres/MySQL showdown that actually matters | by <devtips/> | Medium](https://medium.com/@dev_tips/jsonb-vs-json-the-postgres-mysql-showdown-that-actually-matters-e28db3db3942)

- B-tree: the classic default, good for scalars.
- GIN (Generalized Inverted Index): the MVP for JSONB, supports fast lookups on keys and values.
- GiST (Generalized Search Tree): flexible, supports range queries and similarity search.
- BRIN (Block Range Index): lightweight, great for giant tables with sequential data.
- Bloom extension: probabilistic, fast membership checks.

```sql
CREATE INDEX idx_events_data_gin
ON events USING GIN (data jsonb_path_ops);

SELECT *
FROM events
WHERE data @> '{"status": "active"}'; -- containment operator
```