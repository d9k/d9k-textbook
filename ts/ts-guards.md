# TypeScript: guards

## Type guards supported types

- [How to use type guards in TypeScript - LogRocket Blog](https://blog.logrocket.com/how-to-use-type-guards-typescript/)

- `instanceof` - an instance of a given constructor function or class
- `typeof` - primitive/basic type check
- `in` - object instance has property with specific name
- `===` - checks type too
- `is`

## "`is`" type guards

- :beginner: [User Defined Type Guards | Type Guard | TypeScript Deep Dive](https://basarat.gitbook.io/typescript/type-system/typeguard#user-defined-type-guards)
- :beginner: [Using type predicates | TypeScript: Documentation - Narrowing](https://www.typescriptlang.org/docs/handbook/2/narrowing.html#using-type-predicates)
- :symbols: `function isCat(pet: Dog | Cat): pet is Cat {`