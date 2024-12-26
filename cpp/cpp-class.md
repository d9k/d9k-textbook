# C++: class

### C++ `override`/`virtual`

- [Virtual Function in C++ - GeeksforGeeks](https://www.geeksforgeeks.org/virtual-function-cpp/)
- :speech_balloon: [Why doesn't C++ have virtual variables? | SO](https://stackoverflow.com/questions/3248255/why-doesnt-c-have-virtual-variables)
- [Virtual inheritance - Wikipedia](https://en.wikipedia.org/wiki/Virtual_inheritance)

### C++ abstract class

- [Abstract class - cppreference.com](https://en.cppreference.com/w/cpp/language/abstract_class)

### C++ template class

- :speech_balloon: [c++ - How to avoid specifying arguments for a class template with default template arguments | SO](https://stackoverflow.com/questions/15373823/how-to-avoid-specifying-arguments-for-a-class-template-with-default-template-arg)
- :speech_balloon: [Inheriting from a template class in c++ | SO](https://stackoverflow.com/questions/8810224/inheriting-from-a-template-class-in-c)
- :beginner: [Шаблоны классов | Microsoft Learn](https://learn.microsoft.com/ru-ru/cpp/cpp/class-templates?view=msvc-170)

### C++ multiple inheritance

- [Multiple Inheritance in C++ - GeeksforGeeks](https://www.geeksforgeeks.org/multiple-inheritance-in-c/)

### C++ destructors

- :speech_balloon: [c++ - Destructor for char arrays Error | SO](https://stackoverflow.com/questions/24685133/destructor-for-char-arrays-error)
	- There is no need to check for `NULL` when issuing a `delete`

- https://stackoverflow.com/questions/36020149/how-to-design-class-that-has-char-pointer-as-class-member-variable

### C++ call super constructor

- :speech_balloon: [c++ - What are the rules for calling the base class constructor? | SO](https://stackoverflow.com/questions/120876/what-are-the-rules-for-calling-the-base-class-constructor)

- :speech_balloon: [c++ - Why is my override method not being called? | SO](https://stackoverflow.com/questions/42149093/why-is-my-override-method-not-being-called)
	- While you're inside a constructor, the derived class hasn't been constructed yet, so it effectively doesn't exist - constructors are executed base first, derived second. Any member calls you make from the base class constructor will be to the base class members.
	- If you would call `Show` in derived class from the ctor of the base class, `Child::Show` would use data fields of `Child` but the ctor of the derived class has not been called yet.

- [How can I call overridden function from constructor? - Development / Programming & Scripting - Epic Developer Community Forums](https://forums.unrealengine.com/t/how-can-i-call-overridden-function-from-constructor/287695)
	- In Unreal Engine there are special init functions, like `OnConstruction` and `PostSpawn`, they are called automatically by the engine on every actors’ construction.

- :speech_balloon: [c++ - Do I need to explicitly call the base virtual destructor? | SO](https://stackoverflow.com/questions/677620/do-i-need-to-explicitly-call-the-base-virtual-destructor)
	- Destructors are called automatically in the reverse order of construction. (Base classes last). Do not call base class destructors.