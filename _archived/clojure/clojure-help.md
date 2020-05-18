Help-функции clojure
====================

doc
---

	(use 'clojure.repl)
	(doc function_name)

list functions
--------------

	(keys (ns-publics 'foo))

	(-> 'foo ns-publics keys sort)

get source
----------



find function by word
---------------------

	(require 'clojure.repl)
	(clojure.repl/source foo)

	(find-doc "xor")
