# TypeScript: never type

https://habr.com/ru/post/471026/

## Exhaustive check

- https://www.typescriptlang.org/docs/handbook/2/narrowing.html#exhaustiveness-checking

```ts
type Shape = Circle | Square;

switch (shape.kind) {
	case "square":
	  area = shape.sideLength ** 2;
	default:
	  const _exhaustiveCheck: never = shape;
	  // error: Type 'Circle' is not assignable to type 'never'.
}
```