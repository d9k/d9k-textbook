# NodeJS: Vite

## Vite alias to override import path

- [resolve.alias | Shared Options | Vite](https://vite.dev/config/shared-options.html#resolve-alias)
	- links to [packages/alias | rollup/plugins](https://github.com/rollup/plugins/tree/master/packages/alias)

```js
resolve: {
	alias: [
	  { find: 'utils', replacement: '../../../utils' },
	  { find: 'batman-1.0.0', replacement: './joker-1.5.0' }
	]
}
```