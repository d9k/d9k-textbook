# PHP + MS SQL

## PHP 7

https://docs.microsoft.com/ru-ru/sql/connect/php/installation-tutorial-linux-mac?view=sql-server-ver15



## PHP 5


google freetds

в Zend:

```
resources.db.adapter = "pdo_mssql"
resources.db.params.pdoType="dblib"
resources.db.unadapter = "mssql"
resources.db.params.adapterNamespace = "HM_Db_Adapter"
resources.db.params.host = "freetds_alias_name" ;freetds alias name
````
