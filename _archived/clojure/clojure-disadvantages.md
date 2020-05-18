Недостатки clojure
==================

No informations on data structures

Dynamic invocation –  This is extremely annoying when you change the signature of a function e.g. you remove a parameter. If you miss a spot where the function is called you get an error. This gets even worse if you use restructuring and variable parameter lists. You can do something like this:


http://www.niclas-meier.de/2012/04/first-hundred-days-of-clojure/