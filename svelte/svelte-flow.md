# Svelte: app state flow

## Boundary

Boundaries allow you to ‘wall off’ parts of your app, so that you can:
provide UI that should be shown when `await` expressions are first resolving
handle errors that occur during rendering or while running effects, and provide UI that should be rendered when an error happens

```svelte
onerror={(e) => report(e)}

{#snippet failed(error, reset)}
{#snippet pending()}
```

By default, error boundaries have no effect on the server — if an error occurs during rendering, the render as a whole will fail.
Since 5.51 you can control this behaviour for boundaries with a `failed` snippet, by calling `render(...)` with a `transformError` function.