Linux: настройка почты
======================

postfix
-------


msmtp
-----
[туториал на DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-use-gmail-or-yahoo-with-php-mail-function)

Очистка сообщений mbox
----------------------

https://github.com/alonswartz/mbox-purge
поставить по скрипту

	git clone https://github.com/alonswartz/mbox-purge.git
	for d in $(ls mbox-purge/deps); do
	    cd mbox-purge/deps/$d
	    perl Makefile.PL
	    make
	    make test
	    sudo make install
	    cd -
	done

	# if you want date parsing
	cpan -i Date::Parse

	sudo apt-get install procmail

Использование (фильтр по теме):

mbox-purge --head-pattern '^Subject: Cron <s1eya@orbilet> /home/s1eya/scripts/orbilet_philnov_auto_upda
ter.sh' /home/s1eya/backup/s1eya_mail_mbox

postfix
-------

	sudo service sendmail stop


###Если гугл глючт

http://www.google.com/accounts/DisplayUnlockCaptcha

###Если host is unreachable

`/etc/postfix/main.cf`:
		
	inet_protocols = ipv4

Отправка сообщения с вложением через консоль
---------------------------------------------

http://www.shelldorado.com/articles/mailattachments.html 

`mutt` использует тот же `sendmail` (то есть `postfix`)

http://superuser.com/questions/220913/how-to-send-email-with-attachment-by-postfix-from-command-line

echo "This is a test message" | mutt -s Test -a foo.zip -- $USER