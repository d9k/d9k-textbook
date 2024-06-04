# TypeScript type inference

## from array

```ts
const locales = [
  {
    locale: 'se',
    language: 'Swedish',
  },
  {
    locale: 'en',
    language: 'English',
  }
] as const;
type Locale = typeof locales[number]['locale'];
// type Locale = "se" | "en"
```

https://dev.to/andreasbergqvist/typescript-get-types-from-data-using-typeof-4b9c

## from keys

```ts
const currencySymbols = {
  GBP: '£',
  USD: '$',
  EUR: '€',
}
type CurrencySymbol = keyof typeof currencySymbols;
// type CurrencySymbol = "GBP" | "USD" | "EUR"
```

## Mapped type

https://stackoverflow.com/a/49563070

## Partial inference

https://stackoverflow.com/a/63678777/1760643

Type inference works based on an all or nothing principle. In the first case

https://stackoverflow.com/a/68714226/1760643

I believe currying is the solution.

```ts
const x = <I>(v: I) => <O>((v: I) => O) => O
```

## Infer type from string literal field

```ts
type Result = Extract<Device, { type: 'Laptop' }>;
```

- :speech_balloon: [typescript3.0 - TypeScript: generically infer union type member based on a string literal property | SO](https://stackoverflow.com/questions/54599951/typescript-generically-infer-union-type-member-based-on-a-string-literal-proper/73932296#73932296)
