# JS: prototype

See also [js objects](./js-objects.md), [js class](./js-class.md).

- JS prototype Jupyter Notebook [^j]

## Why use prototype

Using the prototype makes faster object creation since properties/methods on the prototype don't have to be re-created each time a new object is created.

`this.myMethod = /* ... */` => method is created every time you create an object.

`MyClass.prototype.myMethod = /* ... */` => created once.

https://stackoverflow.com/a/8433493

## Property lookup

`myObj.myMethod()` - first looks at the `myObj` object to see if it has a property with the name `myMethod`. If it doesn't, the engine looks the the prototype object for `myObj` to see if _it_ has a property with that name.

JS doesn't have method overloading.

https://stackoverflow.com/a/18402468

## Difference with inheritance

That prototype object has a prototype of its own, and so on until an object is reached with `null` as its prototype. By definition, `null` has no prototype, and acts as the final link in this **prototype chain**.

It is possible to mutate any member of the prototype chain or even swap out the prototype at runtime, so concepts like static dispatching do not exist in JavaScript.

(Static dispatch is a form of polymorphism fully resolved during compile time.)

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain

## Prototype chaining vs prototype shadowing

Prototype shadowing is when a property or method conceals access to an equivalently named one on a superclass, and prototype chaining is simply jargon for prototypal inheritance in object-oriented programming.

https://stackoverflow.com/questions/50443926/what-is-difference-between-prototype-shadowing-and-prototype-chaining-in-javascr#comment87901732_50443926


## Prototype function

```js
function Student() {
    this.name = 'John';
    this.gender = 'M';
}

// Не сработает:
//
// function Student() {
//   return {
//     name:'John',
//     gender: 'M',
//   }
// }

function Student() {
  Object.assign(this, {
    name:'John',
    gender: 'M',
  });
}

Student.prototype.age = 15;

var studObj1 = new Student();
console.log(studObj1.age); // 15
```

https://learn.javascript.ru/prototype-inheritance

Строки (1) и (2) равнозначны


```js
function Rabbit() {}

// по умолчанию:
// Rabbit.prototype = { constructor: Rabbit }

console.log( Rabbit.prototype.constructor == Rabbit );
// true
```

## Свойство __proto__

(не стандарт)

Сеттеры свойств `fn.prototype` и `obj.__proto__` игнорируют все значения кроме объектов и `null`

```js
let animal = {
  eats: true
};

function Rabbit(name) {
  this.name = name;
}

// чтобы не сбивать constructor
Object.assign(Rabbit.prototype, animal)

let rabbit = new Rabbit("White Rabbit");

console.log( rabbit.eats ); // true

let rabbit_2 = new rabbit.constructor("Black Rabbit");

console.log(rabbit_2.name, rabbit_2.eats)

rabbit.__proto__ === Rabbit.prototype
// true
```

```js
arr.toString === arr.__proto__.toString;
// true

(5.56).toPrecision(2)
// 5.6
```

## Одалживание метода из прототипа в экземпляр

```js
let obj = {
  0: "Hello",
  1: "world!",
  length: 2,
};

obj.join = Array.prototype.join;

alert( obj.join(',') );
// Hello,world!
```

## Iterate properties

```js
let animal = {
  eats: true
};

let rabbit = {
  jumps: true,
  __proto__: animal
};

Object.keys(rabbit);
// jumps

for(let prop in rabbit) {
  let isOwn = rabbit.hasOwnProperty(prop);

  console.log((isOwn ? 'Our' : 'Inherited')+ `: ${prop}`);
}
// Our: jumps
// Inherited: eats
```

## Современные методы по работе с прототипами

```js
let animal = {
  eats: true
};

// создаём новый объект с прототипом animal
let rabbit = Object.create(animal, {
  jumps: {
    value: true
  }
});

console.log(rabbit.eats); // true

console.log(Object.getPrototypeOf(rabbit) === animal); // получаем прототип объекта rabbit

Object.setPrototypeOf(rabbit, {}); // заменяем прототип объекта rabbit на {}
```

```js
// клон obj c тем же прототипом (с поверхностным копированием свойств)
let clone = Object.create(
  Object.getPrototypeOf(obj),
  Object.getOwnPropertyDescriptors(obj)
);
```
