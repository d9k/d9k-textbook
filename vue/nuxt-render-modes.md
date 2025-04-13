# Nuxt: rendering modes

- :beginner: [Rendering Modes ·| Concepts | Nuxt docs](https://nuxt.com/docs/guide/concepts/rendering#universal-rendering)

Event handlers run on the client.

[Middlewares](https://nuxt.com/docs/guide/directory-structure/middleware) and pages (https://nuxt.com/docs/guide/directory-structure/pages) run in the server and on the client during hydration. [Plugins](https://nuxt.com/docs/guide/directory-structure/plugins) can be rendered on the server or client or both. [Components](https://nuxt.com/docs/guide/directory-structure/components) can be forced to run on the client only as well. [Composables](https://nuxt.com/docs/guide/directory-structure/composables) and [utilities](https://nuxt.com/docs/guide/directory-structure/utils) are rendered based on the context of their usage.

Edge-side rendering is possible thanks to [Nitro](https://nitro.unjs.io/), the [server engine](https://nuxt.com/docs/guide/concepts/server-engine) that powers Nuxt. It offers cross-platform support for Node.js, Deno, Cloudflare Workers, and more.

`
Example `nuxt.config.ts`:

```ts
export default defineNuxtConfig({
  routeRules: {
    // Homepage pre-rendered at build time
    '/': { prerender: true },
    // Products page generated on demand, revalidates in background, cached until API response changes
    '/products': { swr: true },
    // Product pages generated on demand, revalidates in background, cached for 1 hour (3600 seconds)
    '/products/**': { swr: 3600 },
    // Blog posts page generated on demand, revalidates in background, cached on CDN for 1 hour (3600 seconds)
    '/blog': { isr: 3600 },
    // Blog post page generated on demand once until next deployment, cached on CDN
    '/blog/**': { isr: true },
    // Admin dashboard renders only on client-side
    '/admin/**': { ssr: false },
    // Add cors headers on API routes
    '/api/**': { cors: true },
    // Redirects legacy urls
    '/old-page': { redirect: '/new-page' }
  }
})
```