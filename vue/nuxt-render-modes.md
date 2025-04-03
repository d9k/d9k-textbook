# Nuxt: rendering modes

- :beginner: [Rendering Modes ·| Concepts | Nuxt docs](https://nuxt.com/docs/guide/concepts/rendering#universal-rendering)

Event handlers run on the client.

[Middlewares](https://nuxt.com/docs/guide/directory-structure/middleware) and pages (https://nuxt.com/docs/guide/directory-structure/pages) run in the server and on the client during hydration. [Plugins](https://nuxt.com/docs/guide/directory-structure/plugins) can be rendered on the server or client or both. [Components](https://nuxt.com/docs/guide/directory-structure/components) can be forced to run on the client only as well. [Composables](https://nuxt.com/docs/guide/directory-structure/composables) and [utilities](https://nuxt.com/docs/guide/directory-structure/utils) are rendered based on the context of their usage.

Edge-side rendering is possible thanks to [Nitro](https://nitro.unjs.io/), the [server engine](https://nuxt.com/docs/guide/concepts/server-engine) that powers Nuxt. It offers cross-platform support for Node.js, Deno, Cloudflare Workers, and more.