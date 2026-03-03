# C++: lambda functions

## C++ Lambda Functions / w3schools

https://www.w3schools.com/cpp/cpp_functions_lambda.asp

```cpp
#include <iostream>
#include <functional> // Needed for std::function
using namespace std;

// A function that takes another function as parameter
void myFunction(function<void()> func) {
  func();
  func();
}

int main() {
  auto message = []() {
    cout << "Hello World!\n";
  };

  myFunction(message);
  return 0;
}
```

You can use the `[ ]` brackets to give a lambda access to variables outside of it.

This is called the capture clause.

```cpp
[&x]() {
}
```