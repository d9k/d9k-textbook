# C++: writing simpler code

C++ is very expressive language. Sometimes it's best to limit the usage of it's features to have more simple and bug-free code.

## It's easy to prevent memory leaks in C++! / Low Level Game Dev

https://www.youtube.com/watch?v=vjtm-a0xqB8

Used new keyword only 5 times.

Most objects are containers for pointers which occupy several bytes. So you don't have to allocate on heap much.

You can pass arrays with a legth to functions.

Smart pointers are slow and lead to memory fragmentation.

3:20 Try to avoid polymorphism & exceptions. Use containers instead array with dynamic size e. g. vectors, unordered maps.

4:20 Don't store pointer to texture in game object. Story texture id and operate textures via TextureManager using id. Clean resources in bulk.

6:10 Shared pointer alternatives: temporary allocator, memory arena.

## Why I write C++ like it is C? / Low Level Game Dev

https://www.youtube.com/watch?v=jjjyw0J7gPs

Author don't use most C++ modern features. Because it's hard to use correctly or no benefit.

Operator overloading may lead to bugs.

atd::move - move memory

2:00 std::forward - prevent unnecessary constructions. Unit testing needed.

2:35 C++ quirks list 

3:30 C++ standart vector implementation is large for a reason. C++ as C with vectors.

4:00 Write code than make abstractions. You can split code with #pragma region instead of small functions. Lambdas as temporary functions.

4:45 Events system can lead to weird bug. Easier to debug checking boss health instead of sending/receiving killing event.

5:30 Data-oriented design.

6:05 Throwing exception is like goto that jumps out of miltiple functions. Instead you can return error codes ( enum Erros: int { ... }.

6:40 Custom functions (create(), clear()) instead of constructor and destructor.