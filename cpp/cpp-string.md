# C++: string

### C++ using `* char`

[c - How to Compare 2 Character Arrays - Stack Overflow](https://stackoverflow.com/questions/40605075/how-to-compare-2-character-arrays)

### C++ std::string_view

- :speech_balloon: [Why can I mutate a std::string\_view? : r/cpp\_questions](https://www.reddit.com/r/cpp_questions/comments/1aqu722/why_can_i_mutate_a_stdstring_view/?rdt=46916)
	- _You can pretty much think of `std::string_view` as a `const char*`, except that it is aware of its size and has member functions. Importantly it has constructors form a bunch of "string like" types._ / [IyeOnline](https://www.reddit.com/r/cpp_questions/comments/1aqu722/comment/kqg60wy/)

- :newspaper: [C++ | Тип std:string\_view](https://metanit.com/cpp/tutorial/12.10.php)

- :newspaper: [C++17 — std::string\_view и никакого копирования / Хабр](https://habr.com/ru/companies/otus/articles/715608/)

 - :newspaper: [Three reasons to pass \`std::string\_view\` by value – Arthur O'Dwyer – Stuff mostly about C++](https://quuxplusone.github.io/blog/2021/11/09/pass-string-view-by-value/)

### C++ Using std:string

- :beginner: [std::to\_string - cppreference.com](https://en.cppreference.com/w/cpp/string/basic_string/to_string)

- :beginner: [cplusplus.com/reference/sstream/ostringstream/](https://cplusplus.com/reference/sstream/ostringstream/)

- :newspaper: [C++17 — std::string\_view и никакого копирования | Хабр](https://habr.com/ru/companies/otus/articles/715608/)

- :speech_balloon: [How do I convert from stringstream to string in C++? | SO](https://stackoverflow.com/questions/662976/how-do-i-convert-from-stringstream-to-string-in-c)
	- `ss.str();`

- :speech_balloon: [c++ - How to convert a std::string to const char\* or char\* | SO](https://stackoverflow.com/questions/347949/how-to-convert-a-stdstring-to-const-char-or-char?rq=1)
	- `const char * c = str.c_str();`
	- `char * c = str.data();`

- :speech_balloon: [c++ - convert a char\* to std::string | SO](https://stackoverflow.com/questions/1195675/convert-a-char-to-stdstring)

- :rotating_light: `undefined reference to std::__cxx11::basic_string<char, std::char_traits<char>, std::allocator<char> >::_M_replace_cold`
	- :speech_balloon: [Build errors with GCC 13 | issue #3292 | sonic-pi](https://github.com/sonic-pi-net/sonic-pi/issues/3292)

- _Why store it as a `std::string`? It could mess with the heap_ / [GValiente](https://discord.com/channels/768759024270704641/771045950709694474/1293508271080214598)

- _You can use most of the std lib. like std::string, std::vector, etc. it's slower than using something like etl, but it's there / [GValiente](https://discord.com/channels/768759024270704641/829850171151876127/1174087767689539600)_
