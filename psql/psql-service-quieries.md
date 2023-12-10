# PostgreSQL: service queries

## Show functions

```sql
 SELECT routine_name, specific_schema FROM information_schema.routines
        WHERE routine_type='FUNCTION' -- AND specific_schema='public'
```

## Get column comments

```sql
select
  c.table_schema,
  c.table_name,
  c.column_name,
  pgd.description
from pg_catalog.pg_statio_all_tables as st
inner join pg_catalog.pg_description pgd on (
  pgd.objoid = st.relid
)
inner join information_schema.columns c on (
  pgd.objsubid   = c.ordinal_position and
  c.table_schema = st.schemaname and
  c.table_name   = st.relname
);
```

## Get relations

```sql
    SELECT
      tc.table_schema,
      tc.constraint_name,
      tc.table_name,
      kcu.column_name,
      ccu.table_schema AS foreign_table_schema,
      ccu.table_name AS foreign_table_name,
      ccu.column_name AS foreign_column_name
    FROM information_schema.table_constraints AS tc
    JOIN information_schema.key_column_usage AS kcu
      ON tc.constraint_name = kcu.constraint_name
      AND tc.table_schema = kcu.table_schema
    JOIN information_schema.constraint_column_usage AS ccu
      ON ccu.constraint_name = tc.constraint_name
    WHERE tc.constraint_type = 'FOREIGN KEY'
    --    AND tc.table_schema='public'
    --    AND tc.table_name='mytable';
```