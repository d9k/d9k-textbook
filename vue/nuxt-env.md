# Nuxt: env

## .env

- :beginner: [.env | Nuxt Directory Structure](https://nuxt.com/docs/guide/directory-structure/env)

## Runtime config

- :beginner: [Runtime Config | Nuxt Advanced](https://nuxt.com/docs/guide/going-further/runtime-config)

```sh
NUXT_API_SECRET=api_secret_token
NUXT_PUBLIC_API_BASE=https://nuxtjs.org
```

```ts
export default defineNuxtConfig({
  runtimeConfig: {
    // The private keys which are only available within server-side
    apiSecret: '123', // defalut value if not difined in .env
    // Keys within public, will be also exposed to the client-side
    public: {
      apiBase: '/api'
    }
  }
})
```

```ts
const config = useRuntimeConfig()
console.log('API base URL:', config.public.apiBase)
```
