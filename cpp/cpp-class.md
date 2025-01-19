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

### C++ class fields initialization

- :speech_balloon: [c++ - expected ‘,’ or ‘...’ before string constant | SO](https://stackoverflow.com/questions/65353809/expected-or-before-string-constant)
	- You can't have function-like inittialization inline in classes. You _must_ use curly-braces `{}` or "assignment" like syntax with `=`
- :speech_balloon: [constructor - C++ Why the members are not default initialized? | SO](https://stackoverflow.com/questions/66646883/c-why-the-members-are-not-default-initialized)
	- C++ has a motto, you only pay for what you ask. When declaring a variable without a value, it's wasteful to actually assign some value. You only get a know value when you do so explicitly.

### C++ copy constructor

- :speech_balloon: [Foo g = Foo(1); cannot bind non-const lvalue reference of type ‘Foo&’ to an rvalue of type ‘Foo’ : r/cpp\_questions](https://www.reddit.com/r/cpp_questions/comments/120hi15/foo_g_foo1_cannot_bind_nonconst_lvalue_reference/)
	- The expression `Foo()` creates a temporary object, which is an r-value. L-value references (`Foo&`) cannot bind to rvalues. Because you have defined a constructor `Foo( Foo& )`, which only takes an lvalue reference you dont get a default generated copy constructor or move constructor. Usually you would define a copy constructor as `Foo( const Foo& )`. This can also bind to r-values. Another option is to define define a move constructor `Foo( Foo&& )` that can take r-values directly and potentially make use of move semantics. / IyeOnline

- :speech_balloon: [gcc 9: error: "implicitly-declared '\[...\]::operator=(\[...\])' is deprecated \[-Werror=deprecated-copy\]" · Issue #205 · tsduck/tsduck](https://github.com/tsduck/tsduck/issues/205)

- :beginner: [Copy Constructor in C++ - GeeksforGeeks](https://www.geeksforgeeks.org/copy-constructor-in-cpp/)

- :beginner: [Copy constructors - cppreference.com](https://en.cppreference.com/w/cpp/language/copy_constructor)

### C++ destructors

- :speech_balloon: [c++ - class has virtual functions and accessible non-virtual destructor | SO](https://stackoverflow.com/questions/5827719/class-has-virtual-functions-and-accessible-non-virtual-destructor)

- :speech_balloon: [c++ - Destructor for char arrays Error | SO](https://stackoverflow.com/questions/24685133/destructor-for-char-arrays-error)
	- There is no need to check for `NULL` when issuing a `delete`

- :speech_balloon: [c++ - how to design class that has char\* pointer as class member variable? | SO](https://stackoverflow.com/questions/36020149/how-to-design-class-that-has-char-pointer-as-class-member-variable)

- :speech_balloon: [Does delete call destructor C++? - Quora](https://www.quora.com/Does-delete-call-destructor-C)

- :speech_balloon: [Does C++ call destructors for global and class static variables? | SO](https://stackoverflow.com/questions/2204608/does-c-call-destructors-for-global-and-class-static-variables)

- :speech_balloon: [raii - Is a C++ destructor guaranteed not to be called until the end of the block? | SO](https://stackoverflow.com/questions/2087600/is-a-c-destructor-guaranteed-not-to-be-called-until-the-end-of-the-block/2088114#2088114)

### C++ call super constructor

- :speech_balloon: [c++ - What are the rules for calling the base class constructor? | SO](https://stackoverflow.com/questions/120876/what-are-the-rules-for-calling-the-base-class-constructor)

- :speech_balloon: [c++ - Why is my override method not being called? | SO](https://stackoverflow.com/questions/42149093/why-is-my-override-method-not-being-called)
	- While you're inside a constructor, the derived class hasn't been constructed yet, so it effectively doesn't exist - constructors are executed base first, derived second. Any member calls you make from the base class constructor will be to the base class members.
	- If you would call `Show` in derived class from the ctor of the base class, `Child::Show` would use data fields of `Child` but the ctor of the derived class has not been called yet.

- [How can I call overridden function from constructor? - Development / Programming & Scripting - Epic Developer Community Forums](https://forums.unrealengine.com/t/how-can-i-call-overridden-function-from-constructor/287695)
	- In Unreal Engine there are special init functions, like `OnConstruction` and `PostSpawn`, they are called automatically by the engine on every actors’ construction.

- :speech_balloon: [c++ - Do I need to explicitly call the base virtual destructor? | SO](https://stackoverflow.com/questions/677620/do-i-need-to-explicitly-call-the-base-virtual-destructor)
	- Destructors are called automatically in the reverse order of construction. (Base classes last). Do not call base class destructors.