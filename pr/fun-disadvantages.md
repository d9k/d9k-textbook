Недостатки функционального программирования
===========================================

FP disadvantages
----------------

	http://stackoverflow.com/questions/1786969/pitfalls-disadvantages-of-functional-programming

		Functional idioms often do lots of inversion-of-control or laziness, which often has a negative impact on debugging (using a debugger). (This is somewhat offset by FP being much less error-prone due to immutability/referential transparency, which means you'll need to debug less often.)

		One big disadvantage to functional programming is that on a theoretical level, it doesn't match the hardware as well as most imperative languages. (This is the flip side of one of its obvious strengths, being able to express what you want done rather than how you want the computer to do it.)

		A well-known downside of lazy functional programming (applies to Haskell or Clean but not to ML or Scheme or Clojure) is that it is very difficult to predict the time and space costs of evaluating a lazy functional program—even experts can't do it. This problem is fundamental to the paradigm and is not going away. There are excellent tools for discovering time and space behavior post facto, but to use them effectively you have to be expert already.

		The object-oriented community has spent years developing good explanations for what they do, whereas the functional-programming community seem to think that their stuff is obviously great and doesn't require any special metaphors or vocabulary for explanation. (They are wrong. I am still waiting for the first great book Functional Design Patterns.)

    	> "Generally experts have no difficulty writing fast functional programs; and in fact some of the best-performing parallel programs on 8- and 16-core processors are now written in Haskell."

		Statements like this might give you the impression that experts choose Haskell because it can be so good for parallelism but the truth is that Haskell's performance sucks and the myth that Haskell is good for multicore parallelism is perpetuated by Haskell researchers with little to no knowledge about parallelism who avoid real peer review by only publishing inside the comfort zone of journals and conferences under the control of their own clique. Haskell is invisible in real-world parallel/multicore/HPC precisely because it sucks at parallel programming.