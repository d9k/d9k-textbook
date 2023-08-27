# JS: functional programming

## What are lambda or arrow functions

An arrow function is a shorter syntax for a function expression and does not have its own `this`, `arguments`, `super`, or `new.target`. These functions are best suited for non-method functions, and they cannot be used as constructors.

https://github.com/sudheerj/javascript-interview-questions#what-are-lambda-or-arrow-functions

```
const Foo = () => {
   console.log('constructing');
}

// TypeError: Foo is not a constructor 
const f = new Foo();
```

```
const Foo = () => {
  //  Meta-property 'new.target' is only allowed in the body of a function declaration, function expression, or constructor.
  if (!new.target) {
    console.log('constructing');
  }
}
```

## What is the difference between Call, Apply and Bind?

[Частичное применение или partial application в JavaScript | Frontend Stuff](https://frontend-stuff.com/blog/partial-application/)

Позволяет объявлять и/или использовать методы отдельно от классов.

Функция - объект. Методы объекта-функции.

```
fn1.call(this_value, ...arguments)
fn1.apply(this_value, [...arguments]);
fnWithThisAndArg1 = fn1.bind(this_value, arg1);
```

## bind to 2-nd arg

```
_ = require('lodash');

skipArg = _.bind.placeholder
thisAsNull = null

let concat = function(a, b, c) {
    return a + '' + b + c;
}

console.log( concat(1,2,3) ); // '123'

_concat1 = _.bind(concat, thisAsNull, 1);
console.log( _concat1(2,3) ); // '123'

_concat2 = _.bind(concat, thisAsNull, skipArg, 2);
console.log( _concat2(1,3)); // '123'

_concat3 = _.bind(concat, thisAsNull, skipArg, skipArg, 3);
console.log(_concat3(1,2)) // '123'
```

## map и filter одновременно

`reduce`
`flatMap` - может требовать `polyfill`

## IIFE - Immediately Invoked Function Expression

https://developer.mozilla.org/en-US/docs/Glossary/IIFE

```
(function () {
  /* ... */
})();
```

## What is a higher order function

Higher-order function is a function that accepts another function as an argument or returns a function as a return value or both.

First-order function is a function that doesn’t accept another function as an argument and doesn’t return a function as its return value.

## Unary function

(i.e. monadic) is a function that accepts exactly one argument. It stands for a single argument accepted by a function.

## Closure (Замыкание)

A closure is the combination of a function and the lexical environment within which that function was declared. Useful for HOF.

Пример: создание по циклу обработчиков выбора цвета при нажатии на кнопку.

## Currying

Функции с каррингом - высшего порядка.

Named after a mathematician **Haskell Curry**.

Currying is the process of taking a function with multiple arguments and turning it into a sequence of functions each with only a single argument.

```
const multiArgFunction = (a, b, c) => a + b + c;
const curryUnaryFunction = (a) => (b) => (c) => a + b + c;  
```

Useful example: log function

```js
var _ = require('lodash')

var logFn = (systemPart, importance, message) => {
  console.log(
    `${systemPart}:`, 
    `[${importance}]`, 
    `${(new Date()).toISOString()}:`, 
    message
  );
};

var log = _.curry(logFn);
var logDebugAuth = log('Auth')('DEBUG')
logDebugAuth('wrong password');
```

https://javascript.info/currying-partials