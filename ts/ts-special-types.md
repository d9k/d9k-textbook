# TypeScript special types

## `unknown`

Anything is assignable to unknown, but unknown isn't assignable to anything but itself: У unknown записываемое в него значение может быть любым, а возвращаемое значение нужно приводить к конкретному типу

- [TypeScript: разница между типами any и unknown | Nuances of programming](https://nuancesprog.ru/p/16868/)

В TypeScript, чтобы работать со значением unknown, необходимо определить его тип. С any этого делать не нужно.

```ts
let anyValue: any = 1;
let unknownValue: unknown = 1;

anyValue.helloworld(); // Ошибки нет
unknownValue.helloWorld();  // получаем ошибку TypeScript
```

unknown присваивается самому себе или any, а any — чему угодно.

```ts
let anyValue: any = 1;
let unknownValue: unknown = 1;

let str: string;

str = anyValue; // Ошибки нет
str = unknownValue; // получаем ошибку TypeScript
```

Как видите, перед работой со значением unknown этими ограничениями гарантируется его проверка, что важно для снижения вероятности ошибок времени выполнения.

```ts
let data: unknown = fetchSomeValues();

if (typeof data === 'string') {
   //данные — строка.
} else if (Array.isArray(data)) {
   //данные — массив.
} else if (typeof data === 'object') {
   //данные — объект.
}
```

```ts
interface Vehicle { name: string; model: string; }

function buyVehicle(vehicle: Vehicle){}

// Won't compile:
// buyVehicle({niceVehicle: ''} as Vehicle);
buyVehicle({niceVehicle: ''} as unknown as Vehicle)
```

:speech_balloon: [typescript - 'unknown' vs. 'any' | SO](https://stackoverflow.com/questions/51439843/unknown-vs-any)

Zim: `unknown` is the parent type of all other types. it's a regular type in the type system.
any means "disable the type check". it's a compiler directive.

ecoologic: If you write a function that only passes down an input to another function, use `unknown` for input argument. If you need to call properties on that value, then `any` may be more suitable. Or you can `(item as Stuff).stuffProp`

Dmitri Pavlutin: You can perform `any` operation on `any`, but you have to do a type check or type assertion to operate on `unknown`.

## TypeScript: иерархия типов и их приведение

- :newspaper: [TypeScript: типы и их устройство - Хекслет](https://ru.hexlet.io/blog/posts/sistema-tipov-v-typescript)

В отличие от восходящего, нисходящее приведение типов небезопасно и в большинстве языков со строгой типизацией не может выполняться автоматически.

Иерарархия типов в TypeScript:

```
any, unknown - верхний уровень иерархи
composite types (1 | 2, 'a' | 'b', false | string)
number, string, boolean
1, 'error', true
void
never - нижний уровень иерархии
```

От `any` разрешено низходящее приведение, исключение для совместимости с JS.

## `never`

`never` является подтипом всех остальных типов и не принимает никакие значения, в том числе значения типа any.

`never` может быть задан как тип результата функции, которая всегда выбрасывает ошибку.

## `void`

- [Заметка о void в JavaScript и TypeScript / Хабр](https://habr.com/ru/companies/ruvds/articles/468229/)