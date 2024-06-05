# TypeScript: interface

## Interfaces vs types

- [Interface vs Type alias in TypeScript 2.7 | by Martin Hochel | Medium](https://medium.com/@martin_hotell/interface-vs-type-alias-in-typescript-2-7-2a8f1777af4c)
- [Types vs. interfaces in TypeScript - LogRocket Blog](https://blog.logrocket.com/types-vs-interfaces-typescript/)

- `interface` allow declaration merging (you can define same interface multiple times, and its definitions will merge into one)
	- Declaration merging via interfaces is very important, when we are writing 3rd party ambient type definitions for libraries that are not authored with TypeScript, so consumer has option to extend them, if some definition are missing.

- It's better to use `type` for React `Props` and `State`
	- protect from extending with declaration merging

- `type` allows type aliases definition (new names for existing types)
	- We often combine primitive type with union type to define a type alias
		- `type NullOrUndefined = null | undefined`

- Union `type`
	- There is no equivalent to a union type in an interface.
	- `type Transport = 'Bus' | 'Car' | 'Bike' | 'Walk';`
	- `class` can't implement union type. `interface` can't extend union type.

- `interface` can be used to define function too
	- `interface IAdd { (num1: number, num2:number): number; }`
	- For functions defined with `type` we can take advantage of the advanced type features such as conditional types, mapped types, functions overload, etc.

- `interface` can implement tuple type too:

```ts
interface ITeamMember extends Array<string | number>
{
  0: string; 1: string; 2: number
}
```

`type` only features: type inference, conditional types, [type guards](https://blog.logrocket.com/how-to-use-type-guards-typescript/), mapped types, utility types