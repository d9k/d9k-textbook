Процессы в Linux
================

поиск процесса
--------------
ps aux | grep mysql


Предупреждение о process in background
--------------------------------------

	jobs -l
	disown

kill background process
-----------------------

	$ sleep 100 &
	$ jobs
	[1]+  Running                 sleep 100 &
	$ kill %1

	можно
	$ fg 1
	sleep 100
	^C

http://unix.stackexchange.com/a/104825/48167