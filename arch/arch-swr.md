# Architecture: SWR

- :newspaper: [What is stale-while-revalidate?. \`stale-while-revalidate\` is a caching… | by Rathkalyforgna Chhin | Medium](https://medium.com/@rathkalyforgna/what-is-stale-while-revalidate-f1f22d408f6a)
- :newspaper: [Поддержание свежести данных с помощью устаревших обновлений  |  Articles  |  web.dev](https://web.dev/articles/stale-while-revalidate?hl=ru)

Название “SWR” происходит от stale-while-revalidate, стратегия инвалидации HTTP-кеша, популяризированная [HTTP RFC 5861](https://datatracker.ietf.org/doc/html/rfc5861).

С SWR, компоненты получат поток **постоянно** и **автоматически** обновляющихся данных.

`stale-while-revalidate` is a caching directive used in HTTP headers to provide a way for a client to use a stale (expired) version of a resource while simultaneously revalidating it with the origin server in the background.

Example of HTTP response header:

```
Cache-Control: max-age=3600, stale-while-revalidate=86400
```

- `max-age=3600`: The resource is considered fresh for 3600 seconds (1 hour).
- `stale-while-revalidate=86400:` If the resource is stale (expired), the client is allowed to use it for up to `86400` seconds (`24` hours) while simultaneously revalidating it with the server.

## Optimistic updates

- https://swr.vercel.app/docs/mutation#optimistic-updates

```js
const { data } = useSWR('/api/user', fetcher)

const { trigger } = useSWRMutation('/api/user', updateUserName)

return (
<div>
	<h1>My name is {data.name}.</h1>
	<button onClick={async () => {
		const newName = data.name.toUpperCase()

		trigger(newName, {
		  optimisticData: user => ({ ...user, name: newName }),
		rollbackOnError: true
		})
```

<!-- TODO check example -->

## :stethoscope: #DevTools

- [SWR DevTools | Announcing SWR 2.0](https://swr.vercel.app/blog/swr-v2.en-US#swr-devtools)