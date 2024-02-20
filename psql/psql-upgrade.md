# PostrgreSQL Upgrade

## New:

- [Upgrade PostgreSQL from 9.6 to 10.0 on Ubuntu 16.10 | SO](https://stackoverflow.com/questions/46687645/upgrade-postgresql-from-9-6-to-10-0-on-ubuntu-16-10)

## Old: Upgrade process

`/etc/postgresql/<version>/main/pg_hba.conf`

Make sure has postgres record with `peer` auth method

    local   all             postgres                                peer


http://no0p.github.io/postgresql/2014/03/29/upgrading-pg-ubuntu.html

or

https://wiki.postgresql.org/wiki/Using_pg_upgrade_on_Ubuntu/Debian

