# MySQL: оптимизация запросов

## `EXPLAIN` query columns meanings

https://www.exoscale.com/syslog/explaining-mysql-queries/#:~:text=The%20EXPLAIN%20keyword%20is%20used,DELETE%20%2C%20REPLACE%20%2C%20and%20UPDATE%20.&text=EXPLAIN%20is%20a%20great%20tool%20to%20quickly%20remedy%20slow%20queries.

## `EXPLAIN` query: wrong numbers

Execute ANALYZE TABLE table_name; - it will update statistics that EXPLAIN uses, and you'll get correct numbers

https://stackoverflow.com/questions/1037471/why-the-rows-returns-by-explain-is-not-equal-to-count

## `EXPLAIN`: total examined rows

## Query cache

disabled by default since mysql 5.6

https://dba.stackexchange.com/questions/217577/why-did-mysql-remove-the-query-cache-feature-after-version-8-0

## Query Profiling Using Performance Schema

https://dev.mysql.com/doc/refman/5.6/en/performance-schema-query-profiling.html

## Query cost estimation

https://mydbops.wordpress.com/2016/09/26/cost-based-optimization-in-mysql-5-7/

В [DBeaver](https://dbeaver.io/) `SQL Editor -> Explain execution plan`

Если перед запросом добавить `EXPLAIN format=json`, получим расширенные данные (в `cost_info`)
