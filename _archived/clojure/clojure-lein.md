Clojure lein
============


Установка
---------

`~/profiles.clj`: можно добавлять плагины

	{:user {
		:plugins [
			[lein-localrepo "0.5.3"]
			[lein-exec "0.3.4"]
		]
		:dependencies [
			[org.clojure/clojure "1.6.0"]
		]
	}}


Генерация проекта
-----------------

В пустой папке:

	lein new

Добавить в `project.clj`:

	:main lein-test.core

Шаблон project.clj с объяснениями
---------------------------------

`https://github.com/technomancy/leiningen/blob/stable/sample.project.clj`