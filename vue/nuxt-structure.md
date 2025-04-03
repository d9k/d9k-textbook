# Nuxt: structure

- [Nuxt - Wikipedia](https://en.wikipedia.org/wiki/Nuxt)

## File-based routing

Dynamic parameters can be added using square brackets, and catch-all routes can be added using three dots and square brackets:

- `/pages/about.vue` - Matches /about.
- `/pages/user/[id].vue` - Matches all routes directly under /user.
- `/pages/posts/[...slug].vue` - Matches all routes under /posts.
- `/pages/admin/[[page]].vue` - Matches /admin in addition to all routes directly under it.

## Special folders:

- `composables/`
- `utils/` - helpers functions
- `layouts/` - a page can use a custom layout by using the `definePageMeta()` helper in a setup function or block.
- `middleware/` - enables server logic to run between navigation changes: `defineNuxtMiddleware((to, from) => { //...`

- `server/routes/`
- `server/api/` (`/api/` prefix to routes added)