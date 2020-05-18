MySQL Sandbox
=============

Установка
---------

	sudo apt-get install build-essential libaio1 libaio-dev
	sudo cpan MySQL::Sandbox

скачать исходники MySQL 

	http://dev.mysql.com/downloads/mysql/5.5.html#downloads

например, mysql-5.5.39-linux2.6-x86_64.tar.gz
rpm не подойдёт

	make_sandbox /path/to/mysql-5.5.39-linux2.6-x86_64.tar.gz

Sandbox создастся в `~/sandboxes/msb_5_5_39`

Со следующими логинами/паролями:

	ro_user                        = msandbox_ro
	rw_user                        = msandbox_rw
	repl_user                      = rsandbox
	repl_password                  = rsandbox
	db_user                        = msandbox
	db_password                    = msandbox

[туториал: quick db setups with mysql sandbox](http://www.howtoforge.com/quick-db-setups-with-mysql-sandbox)
