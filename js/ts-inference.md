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
