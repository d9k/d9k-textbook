Долбаный rvm
============

Установка
---------

rvm get stable --auto

В ~/.profile:

	[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

В ~/.bashrc:

	source ~/.rvm/scripts/rvm


	rvm install 1.9.3-dev
	rvm use 1.9.3-dev
	gem install ...
	which ruby
		/home/d9k/.rvm/rubies/ruby-1.9.3-p547-dev/bin/ruby


