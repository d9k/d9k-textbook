# Nuxt: fetch data

## useAsyncData()

- :beginner: [useAsyncData | Nuxt Composables](https://nuxt.com/docs/api/composables/use-async-data)

useAsyncData handles adding responses to the Nuxt payload so they can be passed from server to client without re-fetching the data on client side when the page hydrates.

```ts
const { data, status, error, refresh, clear } = await useAsyncData(
  'mountains',
  () => $fetch('https://api.nuxtjs.dev/mountains')
)

type AsyncDataRequestStatus = 'idle' | 'pending' | 'success' | 'error'
```

Options:
- `server`
- `lazy`
- `immediate`
- `default` value
- `transform` result after resolving
- `getCachedData`
- `pick` keys
- `watch`
- `deep` return data
- `dedupe`: `cancel` existing requests on new | `defer` new request

## `$fetch`

 - :beginner: [$fetch | Nuxt Utils](https://nuxt.com/docs/api/utils/dollarfetch)

Nuxt uses [ofetch](https://github.com/unjs/ofetch) to expose globally the `$fetch` helper for making HTTP requests.

[ofetch](https://github.com/unjs/ofetch) by [unjs](https://github.com/unjs): fetch with useful defaults.

Passing Headers and Cookies: `const requestFetch = requestFetch()`.

- [Interceptors](https://github.com/unjs/ofetch#%EF%B8%8F-interceptors): `onRequest`, `onRequestError`, `onResponse`, `onResponseError`.

## `useFetch()`

- :beginner: [useFetch · Nuxt Composables](https://nuxt.com/docs/api/composables/use-fetch)

Convenient wrapper around [useAsyncData](https://nuxt.com/docs/api/composables/use-async-data) and [$fetch](https://nuxt.com/docs/api/utils/dollarfetch). It automatically generates a key based on URL and fetch options, provides type hints for request url based on server routes, and infers API response type.

