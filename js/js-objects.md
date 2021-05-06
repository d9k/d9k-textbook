# JS объекты

## Prototype function

```
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


```
function Rabbit() {}

// по умолчанию:
// Rabbit.prototype = { constructor: Rabbit }

console.log( Rabbit.prototype.constructor == Rabbit );
// true
```

## Свойство __proto__

(не стандарт)

Сеттеры свойств `fn.prototype` и `obj.__proto__` игнорируют все значения кроме объектов и `null`

```
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

```
arr.toString === arr.__proto__.toString;
// true

(5.56).toPrecision(2)
// 5.6
```

## Одалживание метода из прототипа в экземпляр

```
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

```
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

```
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

```
// клон obj c тем же прототипом (с поверхностным копированием свойств)
let clone = Object.create(
  Object.getPrototypeOf(obj),
  Object.getOwnPropertyDescriptors(obj)
);
```

## Получить собственные поля объекта

`Reflect.ownKeys(obj)`

## Define property

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/defineProperty

## Объекты обёртки простых типов

Самое сложное происходит со строками, числами и булевыми значениями.

```
> Object(5.56).toPrecision(2)
5.6
> (5.56).toPrecision(2)
5.6
```
Как мы помним, они не объекты. Но если мы попытаемся получить доступ к их свойствам, то тогда будет создан временный объект-обёртка с использованием встроенных конструкторов String, Number и Boolean, который предоставит методы и после этого исчезнет.

Эти объекты создаются невидимо для нас, и большая часть движков оптимизирует этот процесс, но спецификация описывает это именно таким образом. Методы этих объектов также находятся в прототипах, доступных как String.prototype, Number.prototype и Boolean.prototype.
