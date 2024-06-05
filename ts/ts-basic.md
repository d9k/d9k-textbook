# Typescript basics

## Typescript REPL

`ts-node`

`ts-node --version`

## Generate d.ts

https://github.com/microsoft/dts-gen


## Typing

https://www.typescriptlang.org/docs/handbook/declaration-files/do-s-and-don-ts.html

## Классический интерфейс (расширяемый)

```
interface Options {
  darkMode?: boolean;
  [otherOptions: string]: unknown;
}
```

https://stackoverflow.com/a/64040868

## Андрей СТаровойт - Эволюция TypeScript

Структурная типизация: тип определяется структурой, определение не играет роли. Если возможные свойства двух классов совпадают, то они assignable. Во Flow номинативная (номинальная?) типизация - проверяется имя типа.

### Статич. типизация решает проблемы:

* Документирование
* Обнаружение ошибок на этапе компиляции
* Управление поведением в runtime (`instanceof`, `typeof`)

### TypeScript 1.4:

* + Union types: `number | string`
* + Type alias: `type A = ...`

### TypeScript 1.5:

* Type guard - избавление от `cast`

### TypeScript 1.6:

* Intersection type: `Foo & {newField: string}` - будет требоваться `newField`
* Типы мощнее интерфейсов. Есть поддержка`implements [type]`
* User-defined type guard function
  - минус: нужно писать свою реализацию `instanceof` для каждого типа
  - нет статической проверки корректности guard function

### TypeScript 2.0:

* Literal types(boolean, number, enum)
  - `let alwaysTrue: true`
* Discriminated union types
  - не нужно собственной реализации `instanceof`
  - автовывод конкретного типа с полем литерального типам
  - работает только для `union`-типов

## TypeScript 2.2:

* Turing-complete type system :)

## TypeScript 2.7:

* "in" guard
  - автовывод конкретного типа по наличию поля

## TypeScript 2.8:

* 20+ сложных типов
  - conditional type: if на типах
    - `type NameOrId<T extends number | string> = T extends number ? IdLabel : NameLabel;`
* User-defined type guard
