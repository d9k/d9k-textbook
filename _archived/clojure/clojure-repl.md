REPL в Clojure
==============

(load-file "src/mylib/core.clj")


clean REPL state
----------------

Очистить функции в текущем пространстве имён *ns*
	
	(map #(ns-unmap *ns* %) (keys (ns-interns *ns*)))

В виде функций

	(comment
	  (ns myutil)
	  (defn ns-clean
	         "Remove all internal mappings from a given name space or the current one if no parameter given."
	     ([] (ns-clean *ns*)) 
	     ([ns] (map #(ns-unmap ns %) (keys (ns-interns ns)))))
	  (ns mytest)

	  ;;stuft goes here
	  
	  (myutil/ns-clean)
	)

http://stackoverflow.com/questions/3636364/can-i-clean-the-repl