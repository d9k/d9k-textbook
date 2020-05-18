Фичи языка clojure
==================

Импорт модулей
--------------

	(require 'clojure.repl)
	(require '[clojure.repl :as repl])

<!-- TODO: use, ns -->


Множественное присваивание
--------------------------

###Вектор

	(def guys-whole-name ["Guy" "Lewis" "Steele"])		

	(let [[f-name m-name l-name] guys-whole-name]
		(str l-name ", " f-name " " m-name))

###Map

	(def guys-name-map
		{:f-name "Guy" :m-name "Lewis" :l-name "Steele"})

	(let [{:keys [f-name m-name l-name]} guys-name-map]
		(str l-name ", " f-name " " m-name))

	> "Steele, Guy Lewis"

В параметрах функции:

	(defn print-last-name [{:keys [l-name]}]
		(println l-name))


Отражения
---------

	(for [method (seq (.getMethods java.awt.Frame))
	         :let [method-name (.getName method)]
	         :when (re-find #"Vis" method-name)]
	  method-name)

	> ("setVisible" "isVisible")

Блок кода (аналог progn)
------------------------

 	(do
     (println "LOG: Computing...")
     (+ 1 1))

Что за проценты (%1, %2..)?
---------------------------



http://www.braveclojure.com/do-things/