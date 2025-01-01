# C++: string

### C++ using `* char`

- :speech_balloon: [c - How to Compare 2 Character Arrays | SO](https://stackoverflow.com/questions/40605075/how-to-compare-2-character-arrays)
	- `strcmp(test, test2) == 0`
	- If you have `[]` after your `new`, you need `[]` after your `delete`.

- :speech_balloon: [delete char\* - C++ Forum](https://cplusplus.com/forum/beginner/58664/)
	 - Visual Studio reports, that `HEAP DESTRUCTION DETECTED`.
	 - You do not (and in fact cannot) free the memory occupied by the string literal "Hello!". A string literal is a static object. Static objects are allocated at program startup and deallocated at termination. The proper form is `const char* chText = "Hello!"`

- :speech_balloon: [c++ - When do you need to delete C-style arrays? | SO](https://stackoverflow.com/questions/56931227/when-do-you-need-to-delete-c-style-arrays)
	- You always and only use `delete` when you have used `new` and `delete[]` when you have used `new[]`. Never mix them. And never mix with (2).

- :speech_balloon: [How to delete char \* in c++? | SO](https://stackoverflow.com/questions/5481503/how-to-delete-char-in-c)

### C++ chars search

- :speech_balloon: [C++ How to find char in a char array by using find function? | SO](https://stackoverflow.com/questions/4060210/c-how-to-find-char-in-a-char-array-by-using-find-function)
	- `std::find`

- :speech_balloon: [c++ - searching substrings in char array | SO](https://stackoverflow.com/questions/20649390/searching-substrings-in-char-array)
	- `chars.find(s)`
	- `strstr(a, b)`


- :beginner: [std::find, std::find\_if, std::find\_if\_not - cppreference.com](https://en.cppreference.com/w/cpp/algorithm/find)

### C++ std::string_view

- :speech_balloon: [Why can I mutate a std::string\_view? : r/cpp\_questions](https://www.reddit.com/r/cpp_questions/comments/1aqu722/why_can_i_mutate_a_stdstring_view/?rdt=46916)
	- _You can pretty much think of `std::string_view` as a `const char*`, except that it is aware of its size and has member functions. Importantly it has constructors form a bunch of "string like" types._ / [IyeOnline](https://www.reddit.com/r/cpp_questions/comments/1aqu722/comment/kqg60wy/)

- :speech_balloon: [c++ - Can I change a std::string, which has been assigned to a std::string\_view | SO](https://stackoverflow.com/questions/76555533/can-i-change-a-stdstring-which-has-been-assigned-to-a-stdstring-view)
	- `std::string_view` is just fancy form of const reference to buffer containing characters. This buffer can be manged by `std::string` or can be string literal or some array of char.
	- As a result use of `std::string_view` must not extend beyond of lifetime of this buffer. In your example buffer was modified before string view was used leading to undefined behavior.

- :newspaper: [C++ | Тип std:string\_view](https://metanit.com/cpp/tutorial/12.10.php)

- :newspaper: [C++17 — std::string\_view и никакого копирования / Хабр](https://habr.com/ru/companies/otus/articles/715608/)

 - :newspaper: [Three reasons to pass \`std::string\_view\` by value – Arthur O'Dwyer – Stuff mostly about C++](https://quuxplusone.github.io/blog/2021/11/09/pass-string-view-by-value/)

### C++ Using std:string

- :beginner: [std::to\_string - cppreference.com](https://en.cppreference.com/w/cpp/string/basic_string/to_string)

- :beginner: [cplusplus.com/reference/sstream/ostringstream/](https://cplusplus.com/reference/sstream/ostringstream/)

- :newspaper: [C++17 — std::string\_view и никакого копирования | Хабр](https://habr.com/ru/companies/otus/articles/715608/)

- :speech_balloon: [c++ - stringstream, string, and char\* conversion confusion | SO](https://stackoverflow.com/questions/1374468/stringstream-string-and-char-conversion-confusion)
	- `stringstream.str()` returns a temporary string object that's destroyed at the end of the full expression. If you get a pointer to a C string from that (`stringstream.str().c_str()`), it will point to a string which is deleted where the statement ends. That's why your code prints garbage. You could copy that temporary string object to some other string object and take the C string from that one:

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
