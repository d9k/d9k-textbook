# TypeScript type inference

## from array

```
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

```
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
