# Typescript: generics

## With functions

https://www.typescriptlang.org/docs/handbook/2/functions.html

## React.FC with generics

https://stackoverflow.com/a/62705164/1760643
https://stackoverflow.com/a/60735856/1760643

## const function as generic

- :speech_balloon: [typescript - Declaring const of generic type | SO](https://stackoverflow.com/questions/51197819/declaring-const-of-generic-type)

```ts
type FunctionType<TValue> = (value: TValue) => void;
const bar: FunctionType<number> = (value) => { /** value is number */ }
```

To define a type that is a generic function we need to put the type parameter before the arguments list

```ts
type FunctionType = <TValue>(value: TValue) => void;
const bar: FunctionType = <TValue>(value) => { /** generic function */ }
```