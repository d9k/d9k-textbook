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
```

## PHP 7

1)

```
sudo pecl install -f sqlsrv
sudo pecl install -f pdo_sqlsrv
sudo phpenmod -v 7.3 sqlsrv pdo_sqlsrv
```

https://askubuntu.com/a/1319881/156571

2) ODBC 17 driver

`sudo apt install msodbcsql17`

https://docs.microsoft.com/ru-ru/sql/connect/odbc/linux-mac/installing-the-microsoft-odbc-driver-for-sql-server?view=sql-server-ver15
