# RTK: query

## Запросы друг за другом

```
const firstResult = useFirstQuery()
const secondResult = useSecondQuery(firstResult.isSuccess ? firstResult.data : skipToken)
// or
const secondResult = useSecondQuery(firstResult.data, { skip: !firstResult.isSuccess })
```

https://github.com/reduxjs/redux-toolkit/issues/1891

## await запроса

```
// Get the trigger
const [getPokemon] = useLazyGetPokemonQuery();

// Then you can call with await
await getPokemon().unwrap();

// Or with standard promise
getPokemon()
  .unwrap()
  .then((fulfilled) => console.log(fulfilled))
  .catch((rejected) => console.error(rejected));
```

https://stackoverflow.com/questions/70322004/how-to-use-await-for-get-request-in-rtkquery