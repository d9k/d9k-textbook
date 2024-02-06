# PostgreSQL: execute

## CALL vs SELECT vs PERFORM vs EXECUTE

- You cannot `CALL` a function.
- You cannot `SELECT` or `PERFORM` a procedure.
- You cannot `PERFORM` an `EXECUTE`, or `EXECUTE` a `PERFORM`, neither being an SQL command.

- [postgresql - PL/pgSQL: PERFORM vs CALL | SO](https://stackoverflow.com/questions/67709708/pl-pgsql-perform-vs-call/67711519#67711519)
