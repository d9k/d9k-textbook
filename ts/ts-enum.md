# TypeScript: enum

Enums (перечисления) в TypeScript — конструкция, позволяющая определить набор именованных констант.

Numeric Enums (Числовые перечисления)
Значения по умолчанию автоматически присваиваются, начиная с 0. Но можно и задать стартовое/последующие значения вручную. Единственный тип enum, который компилируется в объект (обратное отображение ­— **reverse mapping**), а не просто заменяется значениями и исчезает из кода.

String Enums (Строковые перечисления) - каждое значение явно задаётся строкой.

Heterogeneous Enums -
сочетание числовых и строковых значений (не рекомендуется).

const enum в отличие от обычных полностью удаляются при компиляции, заменяясь значениями.

:speech_balloon: [How to get the name of TypeScript enum type in runtime? | SO](https://stackoverflow.com/questions/59822723/how-to-get-the-name-of-typescript-enum-type-in-runtime)
## Enum limitations

[TypeScript Style Guide | mkosir](https://mkosir.github.io/typescript-style-guide/#enums--const-assertion)

Enums are discouraged in the TypeScript ecosystem due to their runtime cost and quirks.

Prefer:
- Literal types whenever possible.
- Const assertion arrays when looping through values.
- Const assertion objects when enumerating arbitrary values.

## Exclude from enum

```ts
const v: Exclude<MyEnum, MyEnum.ALL | MyEnum.SOME> = MyEnum.OTHER;
```

## Check enum to have values

:speech_balloon: [Can I restrict the type of enum values? | /r/typescript](https://www.reddit.com/r/typescript/comments/1hktrb1/can_i_restrict_the_type_of_enum_values/)

```ts
type UsesValuesFrom<T> = { [K in T as string]: K }

export type ApprovedStrings =
  | 'foo'
  | 'bar'
  | 'bing';

enum MyEnum {
  Foo = 'foo',
  Bing = 'bing',
}

MyEnum satisfies UsesValuesFrom<ApprovedStrings>
```