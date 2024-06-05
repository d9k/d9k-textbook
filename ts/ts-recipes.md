# TypeScipt: Рецепты

## Partial, но только для некоторых полей

```
export type PartialFields<T, K extends keyof T> = Omit<T, K> & Partial<T>;
```

https://github.com/Microsoft/TypeScript/issues/25760#issuecomment-705137615
