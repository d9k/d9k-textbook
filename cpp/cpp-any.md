# C++: any

- :speech_balloon: [c++ - std::any without RTTI, how does it work? | SO](https://stackoverflow.com/questions/51361606/stdany-without-rtti-how-does-it-work)
	- Basically, `std::any` holds two things:
		- A pointer to a (dynamically) allocated storage
			- A pointer to a "storage manager function"

 - :newspaper: [C++ | std::any - comparison with void\* and motivating examples - nextptr](https://www.nextptr.com/tutorial/ta1571648512/stdany-comparison-with-void-and-motivating-examples)

 - :beginner: [std::any\_cast - cppreference.com](https://en.cppreference.com/w/cpp/utility/any/any_cast)

## C++: any: pointer to object

```cpp
std::any result;
result = new Movie();

Movie * r = std::any_cast<Movie*>(result);

delete std::any_cast<Movie>(&result);
```