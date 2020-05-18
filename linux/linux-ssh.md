Рецепты ssh
===========

Русская раскладка
-----------------
# aptitude install locales
# dpkg-reconfigure locales

# aptitude install console-setup
# dpkg-reconfigure keyboard-configuration 
http://www.debian.org/releases/stable/amd64/apds03.html.ru

В ~/.bashrc, ~/.zshrc:
LC_CTYPE="ru_RU.utf8"
LC_COLLATE="ru_RU.utf8"k

Безопасность
------------
$sudo nano /etc/ssh/sshd_config
Port 22
Port 14543
# можно одновременно, чтобы не заблокировать себе доступ
#! see linux_iptables.txt for port settings
$sudo /etc/init.d/ssh restart
PermitRootLogin no

scp
---
scp -P 9999 -r file.gz root@server2.my:~/

http://wiki.enchtex.info/tools/console/scp

Туннелирование mysql
--------------------

ssh -L 3306:localhost:3306 exampleuser@example.com

3306: - локальный порт
:3306 - удаленный порт

запросит пароль, не закрывать соединение

(гайд)[http://kb.mediatemple.net/questions/133/Tunnel+local+MySQL+server+through+SSH]

Запуск скрипта на удалённом сервере
-----------------------------------

	ssh user@host ARG1=$ARG1 ARG2=$ARG2 'bash -s' <<'ENDSSH'
	  # commands to run on remote host
	  echo $ARG1 $ARG2
	ENDSSH

http://stackoverflow.com/questions/305035/how-to-use-ssh-to-run-shell-script-on-a-remote-machine

Генерация ключей
----------------

http://www.aitishnik.ru/linux/ssh-debian/generatsiya-kliuchey.html

/etc/ssh/sshd_config:

	HostKey /etc/ssh/ssh_host_rsa_key
	#HostKey /etc/ssh/ssh_host_dsa_key
	#HostKey /etc/ssh/ssh_host_ecdsa_key

В консоли

	rm /etc/ssh/ssh_host*

Генерация ключей 2
------------------

	ssh-keygen -t rsa -b 4096 -f ~/.ssh/key-name

Будут сгенерированы `key-name` и `key-name.pub`

Добавить ключ на удалённый сервер
---------------------------------

...чтобы можно было использовать его для входа (копируется в .ssh/:

	ssh-copy-id -i ~/.ssh/needed_file.pub remote_user@remote_host -p 22


Запуск долгой команды в ssh
---------------------------

	nohup myprogram > foo.out 2> foo.err < /dev/null &

`disown` - detach current background job from sessions

http://serverfault.com/questions/172484/doing-a-long-running-command-on-ssh
http://stackoverflow.com/questions/29142/getting-ssh-to-execute-a-command-in-the-background-on-target-machine

Отмена проверки fingerprint
---------------------------

	`ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no `

http://linuxcommando.blogspot.ru/2008/10/how-to-disable-ssh-host-key-checking.html

Когда не подключается
---------------------

отладка

	`ssh -vvvvv`...

Отключить посылку public keys
-----------------------------

Причина ошибки `Too many authentication failures`, возможно, кроется в том, что ssh по-умолчанию посылает все подключенные public-ключи серверу и на сервере есть настройка автоматически закрывать соединение после нескольких попыток аутентификации.

	ssh -o PreferredAuthentications=keyboard-interactive -o PubkeyAuthentication=no -l username host-name.domain

Could not open a connection to your authentication agent
--------------------------------------------------------

просто перезапустить ssh: 

    eval `ssh-agent -s`

Пароль ssh
----------

	$ sudo apt-get install sshpass
	$ sshpass -p your_password ssh user@host-name