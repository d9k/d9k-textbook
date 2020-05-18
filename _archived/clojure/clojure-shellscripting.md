Консольные скрипты на clojure
=============================

bar.clj:

	#!/usr/bin/env lein-exec

	(require 'leiningen.exec)
	 
	;; Add a dependency to the classpath on the fly
	(leiningen.exec/deps '[[enlive/enlive "1.1.4"]])
	 
	(require '[net.cgrand.enlive-html :as html])
	 
	;; Grab and print the title element from the Google front page using Enlive
	(println (html/select (html/html-resource (java.net.URL. "http://google.com")) [:title]))

	https://github.com/kumarshantanu/lein-exec
	
в /bin/

	wget https://raw.github.com/kumarshantanu/lein-exec/master/lein-exec

[туториал](http://koodo.wordpress.com/2013/11/09/shell-scripting-with-clojure/)


detect REPL
-----------

	#!/usr/bin/env lein-exec
	(println "1 + 2 =" (+ 1 2))
	(println (if (not-empty *command-line-args*) "I run from command line" "I run from REPL"))