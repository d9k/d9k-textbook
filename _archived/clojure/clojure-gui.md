Clojure GUI
===========

best tutorial. EVAR
-------------------

[seesaw REPL tutorial](https://gist.github.com/daveray/1441520)

remove listeners
----------------

	(doseq [lr (.getActionListeners button)] (.removeActionListener button lr))

справка
-------

	(use 'seesaw.dev)
	(show-options (frame))

http://nathanwilliams.github.io/2013/05/15/seesaw-gui-programming-the-clojure-way/