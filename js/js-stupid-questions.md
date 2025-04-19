# JS stupid questions

- See corresponding jupyter notebook [^j]

Вопросы, которые зачем-то регулярно спрашивают на собеседованиях (часть по legacy).

## Типы данных JavaScript

(Результат оператора `typeof`)

`number`, `bigint`, `boolean`, `undefined`, `null`, `symbol`, `object`.

## var, let и const - разница

[Var, let и const в JavaScript: в чём разница между переменными в JS / Skillbox Media](https://skillbox.ru/media/code/chem_razlichayutsya_var_let_i_const_v_javascript/)
```js
var x = 50;

function func() {
  var x = 10;
  //Будет выведено 10
  console.log(x);

  //Будет выведено 50
  console.log(window.x);
}
```

```js
function showPodcast() {
	console.log(best_podcast);
	//Вызовем переменную перед её объявлением
	best_podcast = 'people and code';
	if (false) {
		var best_podcast;
	}
}

showPodcast(); //Ошибки не будет, браузер выведет undefined
```

Переменные, объявленные с помощью `let`, нельзя объявить повторно — программа выдаст ошибку. `let`-переменные тоже «всплывают», но при попытке обратиться к ним до инициализации вы получите ошибку `ReferenceError`.

Попытка изменить значение константы приведёт к ошибке - `TypeError`?

Неизменяемым сохраняется сам `const`-объект, а не его поля:

## Hoisting ("всплытие")

Hoisting is a JavaScript mechanism where `vari`, `function` and `class` declarations are moved to the top of their scope before code execution.

## Temporal Dead Zone

```js
function someMethod() {
  // undefined
  console.log(counterVar);

  // ReferenceError, temporal dead zone for counter2
  console.log(counterLet);

  var counterVar = 1;
  let counterLet = 2;
}
```

## Scope (Область действия)

Определяет видимость переменных в процессе выполнения программы.

Before ES6 (2015), JavaScript had only Global Scope and Function Scope.
ES6 introduced two important new JavaScript keywords: `let` and `const`.
These two keywords provide Block Scope in JavaScript.
Variables declared inside a { } block cannot be accessed from outside the block

- https://www.w3schools.com/js/js_scope.asp

## Разница между undefined, null и void.

`null`: переменная-указатель на null-объект (переменная намеренно объявлена пустой). Преобразуется в `0 ` при арифметических операциях.
`undefined`: переменная объявлена, но не задано значение. Преобразуется в `NaN` при арифметических операциях
`void`: оператор, выполняющий выражение и всегда возвращающий `undefined`. `<href="JavaScript:void(0);` предотвращает перезагрузку страницы. (`void(0)` можно считать более коротким синонимом `undefined`, подставляемым при минификации кода)

```js
> console.log(void(1+1))
undefined
> null * 5
0
> 5 / null
Infinity
> undefined * 5
NaN
> 5 / undefined
NaN
```

- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/void
- https://github.com/sudheerj/javascript-interview-questions#what-is-a-void-operator

## Особые состояния числа

```js
> typeof(NaN)
'number'
> typeof(Infinity)
'number'
> 5 / 0
Infinity
> 5 / 0 === Infinity
true
> -5 / 0 === -Infinity
true
> isFinite(-5 / 0)
false
> isFinite(7)
true
> Math.sqrt(-1)
NaN
> Math.sqrt(-1) === NaN
false
> isNaN(Math.sqrt(-1))
true
> isFinite(Math.sqrt(-1))
true
```

## Разница native, host and user objects

native - предоставлено самим javascript
host - средой исполнения
user - определены пользователем в коде JavaScript

## Разница HTML attributes и DOM properties

https://stackoverflow.com/a/53924373/1760643

## Разница событий `load` и `DOMContentLoaded`

Ответ в [js-events.md](./js-events.md).

## BOM

__The Browser Object Model__ allows JavaScript to operate with browser. It consists of the objects `navigator`, `history`, `screen`, `location`, `XMLHttpRequest` etc which are the children of the window. The BOM is not standardized and can change based on different browsers.

## How to redirect

```js
window.location.href = "newPage.html";
```

## How do you assign default values to variables

```js
var a = b ?? c;
```

- `b` can't be `''` , `0`, `false`

```js
var a = b ?? c;
```

## What would be the result of 1+2+'3'

`33`

# Give an example where do you really need semicolon

https://www.freecodecamp.org/news/lets-talk-about-semicolons-in-javascript-f1fe08ab4e53/

## Links

[^j]: [js stupid questions jupiter notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-stupid-questions.ipynb)

## Give an example where do you really need semicolon[](http://localhost:8888/notebooks/js-stupid-questions.ipynb#Give-an-example-where-do-you-really-need-semicolon)

[https://www.freecodecamp.org/news/lets-talk-about-semicolons-in-javascript-f1fe08ab4e53/](https://www.freecodecamp.org/news/lets-talk-about-semicolons-in-javascript-f1fe08ab4e53/)

```js
var a = 1, b = 2

// These 2 lines concat to `const c = a + b(a + b).toString()`
// with an error "b is not a function"
var c = a + b
(a + b).toString()
```

## Short circuit condition

```js
if (authenticate) {
  loginToPortal();
}
```

can be transformed to:

```js
authenticate && loginToPortal();
```


Short-circuit evaluation, minimal evaluation, or McCarthy evaluation (after John McCarthy creator of Lisp) is the semantics of some Boolean operators in some programming languages in which the **second argument is** executed or **evaluated only if the first argument does not suffice** to determine the value of the expression: when the first argument of the AND function evaluates to false, the overall value must be false; and when the first argument of the OR function evaluates to true, the overall value must be true.

- https://en.wikipedia.org/wiki/Short-circuit_evaluation

## Sort numbers array

- :newspaper: [How not to sort an array in JavaScript | Phil Nash](https://philna.sh/blog/2019/08/26/how-not-to-sort-an-array-in-javascript/)
```js
> [11, 1, 6, 20].sort()
[ 1, 11, 20, 6 ]
> [11, 1, 6, 20].sort((a, b) => a - b)
[ 1, 6, 11, 20 ]
> [11, undefined, 1, null, -5, 6, 20, 0].sort((a, b) => a - b)
[ -5, null, 0, 1, 6, 11, 20, undefined ]
```

lodash:

```js
> _.sortBy([11, undefined, 1, null, -5, 6, 20, 0].sort((a, b) => a - b))
[ -5, 0, 1, 6, 11, 20, null, undefined ]
```