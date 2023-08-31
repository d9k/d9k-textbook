# JS stupid questions

Вопросы, которые зачем-то регулярно спрашивают на собеседованиях (часть по legacy).

## Типы данных JavaScript

`number`, `bigint`, `boolean`, `undefined`, `null`, `symbol`, `object`.

## var, let и const - разница

[Var, let и const в JavaScript: в чём разница между переменными в JS / Skillbox Media](https://skillbox.ru/media/code/chem_razlichayutsya_var_let_i_const_v_javascript/)
```
var x = 50;

function func() { 
  var x = 10; 
  //Будет выведено 10
  console.log(x);

  //Будет выведено 50
  console.log(window.x); 
}
```

```
function showPodcast() { 
	//Вызовем переменную перед её объявлением 
	best_podcast = 'people and code'; 
	if (false) {
		var best_podcast; 
	} 
	console.log(best_podcast); 
} 

showPodcast(); //Ошибки не будет, браузер выведет undefined
```

Переменные, объявленные с помощью `let`, нельзя объявить повторно — программа выдаст ошибку. `let`-переменные тоже «всплывают», но при попытке обратиться к ним до инициализации вы получите ошибку `ReferenceError`.

Попытка изменить значение константы приведёт к ошибке - `TypeError`?

Неизменяемым сохраняется сам `const`-объект, а не его поля:

## Hoisting ("всплытие")

Hoisting is a JavaScript mechanism where `vari`, `function` and `class` declarations are moved to the top of their scope before code execution.

## Temporal Dead Zone

```
function somemethod() {
  // undefined
  console.log(counter1); 
  
  // ReferenceError, temporal dead zone for counter2
  console.log(counter2); 
  
  var counter1 = 1;
  let counter2 = 2;
}
```

## Scope (Область действия)

Определяет видимость переменных в процессе выполнения программы.

## Разница между undefined и null

`null`: переменная-указатель на null-объект (переменная намеренно объявлена пустой). Преобразуется в `0 ` при арифметических операциях.
`undefined`: переменная объявлена, но не задано значение. Преобразуется в `NaN` при арифметических операциях

## Что в window

свойства: `console, document, history, localStorage, location (read-only), scheduler, navigator, screen, sessionStorage, speechSynthesis`

свойства, сввязанные с iframe: `frames, length, name, opener, parent, top`

свойства про видимость элементов интерфейса браузера: `locationbar, menubar, peronalbar, statusbar, toolbar`

методы: `alert(), open() / close(), confirm(), focus() / blur(), {request,canc}AnimationFrame(), {request,cancel}IdleCallback(), {set,clear}Immediate, postMessage(), print(), prompt(), stop()`

события: `afterprint, beforeUnload, focus / blur, copy / cut / paste, devicemotion, deviceorientation, error, hashchange, load, message, online / offline, resize, storage, unhandledrejection`

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

## Event flow

Before your click actually reaches the target element, it must trigger the click event for each of its parent elements first, starting from the `window` object.

There are two ways of event flow:

- Top to Bottom (Event Capturing) or root to leaf
- Bottom to Top (Event Bubbling) or leaf to root
## Что в window.navigator

свойства: `clipboard, cookieEnabled, geolocation, gpu (WebGPU), hardwareConcurrency, language, languages, mediaCapabilities, mediaDevices, onLine, platform, serviceWorker, userActivation, userAgent, webdriver`

методы: `getBattery(), {un,}registerProtocolHandler(), sendBeacon(), share() / canShare(), vibrate()`

## Что в window.document

свойства: `characterSet, cookie, doctype, documentURI. fonts, fullscreenElement, location, title, URL, visibilityState`

свойства про DOM: `body, children, documentElement (html), embeds, forms, head, images, links, pictureInPictureElement, readyState, referrer, scripts, styleSheets`

методы: ``

## Что в window.document.body

(какие-то из этих методов и в document)

методы про DOM: `adoptNode(), append(), createAttributeNS()`