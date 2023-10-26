# Supabase

## About

- :tv: [Supabase in 100 Seconds - YT](https://www.youtube.com/watch?v=zBZgdTb-dns)

## Supabase disadvantages

- Локации серверов - без Китая и Восточной Европы (2023)
- Сложно развёртывать самому: docker composer с неск. сервисами

## Supabase: features from PostgreSQL

- permissions (row-level security) with CREATE POLICY
	- https://www.postgresql.org/docs/current/sql-createpolicy.html
- Triggers
- Functions
- [PostgREST](https://postgrest.org)
	- [data types](https://postgrest.org/en/stable/how-tos/working-with-postgresql-data-types.html)
- generated columns
- pgsodium - cryptography
- [GraphQL support](https://supabase.com/blog/graphql-now-available)
	- :balloon: [supabase-graphql-example | GitHub](https://github.com/supabase-community/supabase-graphql-example#schema-public)
		- _"HackerNews-like clone built with Supabase"_
- [JSON schema validation](https://supabase.com/blog/pg-jsonschema-a-postgres-extension-for-json-validation)
## Supabase: own features

- :beginner: [TypeScript support](https://supabase.com/docs/reference/javascript/typescript-support)
	-  :building_construction: `supabase gen types typescript --project-id abcdefghijklmnopqrst > database.types.ts`
- Auth schema
- generates custom API documentation
- [supabase/realtime](https://github.com/supabase/realtime) - Broadcast, Presence, and Postgres Changes via WebSockets

## Supabase versus...

- :vs: Pocketbase
	- :newspaper: [Pocketbase vs. Supabase: An in-depth comparison (Auth, DX, etc.)](https://www.programonaut.com/pocketbase-vs-supabase-an-in-depth-comparison-auth-dx-etc/#effort-first)
		- simple deploy (one golang executable)
		- SQLite in Write-Ahead-Log mode is pretty fast
- :vs: Firebase
	- :tv: [Firebase vs Supabase — I Built The Same App With Both - YT](https://www.youtube.com/watch?v=yGbGxWMv9KA&t=181s)
		- Supabase: only 1 local function
		- Supabase: on top of PSQL

## Supabase Postgres functions languages

- [js: plv8](https://supabase.com/docs/guides/database/extensions/plv8)

## Supabase + Swagger

- :balloon: https://supabase.github.io/storage-api/
	- :balloon: https://project.supabase.co/rest/v1/?apikey=anon-key
- :speech_balloon: [Generate types using Swagger OpenAPI specification fails | issue #281 supabase](https://github.com/supabase/supabase/issues/281)
	- :building_construction:
```bash
npx openapi-typescript https://<my project>.supabase.co/rest/v1/?apikey=<key> --output types/supabase.ts"`
```
