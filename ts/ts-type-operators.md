# TS: type operators

## `satisfies` operator

[TypeScript: Documentation - TypeScript 4.9](https://www.typescriptlang.org/docs/handbook/release-notes/typescript-4-9.html)

`satisfies` - проверка в коде без преобразования типа. Может пригодиться для сохранения типа union-полей конкретного объекта как экземпляра типа:

```ts
type Colors = "red" | "green" | "blue";
type RGB = [red: number, green: number, blue: number];

const palette: Record<Colors, string | RGB> = {
    red: [255, 0, 0],
    green: "#00ff00",
    // typo correctly detected:
    // bleu: [0, 0, 255]
};
// Error: property 'toUpperCase' does not exist on type 'string | RGB'
// const greenNormalized = palette.green.toUpperCase();
```

Solution:

```ts
const palette = {
    red: [255, 0, 0],
    green: "#00ff00",
    // typo correctly detected:
    // bleu: [0, 0, 255]
} satisfies Record<Colors, string | RGB>;
// Just works; type was not narrowed
const greenNormalized = palette.green.toUpperCase();
```