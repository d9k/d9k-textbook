# PSQL: transactions

## PostgreSQL: MVCC all the way

[JSONB vs JSON: the Postgres/MySQL showdown that actually matters | by <devtips/> | Medium](https://medium.com/@dev_tips/jsonb-vs-json-the-postgres-mysql-showdown-that-actually-matters-e28db3db3942)

:sparkles: Postgres uses MVCC (Multi-Version Concurrency Control), which basically means: every transaction sees a snapshot of the database at the time it started. No readers blocking writers, no writers blocking readers. Everyone gets their own version of reality like multiple devs editing the same code branch without merge conflicts… until later.

Isolation levels: READ COMMITTED (default), REPEATABLE READ, and full SERIALIZABLE.

Because of MVCC, Postgres doesn’t really use locks for reads. It just keeps old row versions around.

:microbe: Downside: you eventually need VACUUM to clean up dead tuples, or else bloat builds up like unmerged Git branches.

