# DB: Supabase: service

## Sync prod to local

- https://www.reddit.com/r/Supabase/comments/12r79d0/comment/k6u3tqi/?utm_source=reddit&utm_medium=web2x&context=3

[Link your local database](https://supabase.com/docs/guides/cli/local-development#link-your-project) then

`supabase pull`

`supabase db dump --data-only > supabase/dump-data.sql`

then run this sql on local database started with `supabase start`.

Usually it's `localhost:54322`, `postgres` db, `postgres` user, `postgres` password.

### About another solution:

`supabase db remote commit` prints warning:

`Command "commit" is deprecated, use "db pull" instead.`

### Consequent data dumps

...would sync records insertions but wouldn't sync records deletions.

To fix it clear target local tables before applying data dump.

For example you can achieve it with [DBeaver x-platform database client](https://stackoverflow.com/a/64819402/1760643).

Select tables to clear, right click, Tools -> Truncate, then on dialog window "Truncate table parameters" -> "Settings" -> check "\[v\] Cascade" -> \[Proceed\] button

## Migrations: develop on remote

Change remote structure, then:

```bash
npm exec supabase pull
npm exec supabase migration up
npm exec supabase migration list
npm exec supabase migration repair 20231028215841 --status applied
```