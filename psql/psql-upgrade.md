PostrgreSQL Upgrade
===================

## Upgrade process

`/etc/postgresql/<version>/main/pg_hba.conf`

Make sure has postgres record with `peer` auth method

    local   all             postgres                                peer


http://no0p.github.io/postgresql/2014/03/29/upgrading-pg-ubuntu.html

or

https://wiki.postgresql.org/wiki/Using_pg_upgrade_on_Ubuntu/Debian

