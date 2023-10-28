# Database: terms

## Partial index

If you are frequently querying a subset of rows then it may be more efficient to build a partial index.

```sql
create index idx_living_persons_age on persons (age)
where deceased is false;
```

- https://supabase.com/docs/guides/database/postgres/indexes#partial-indexes