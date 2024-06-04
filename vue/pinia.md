# Vue: #Pinia

- `$patch` - store bulk data change (in one mutation)

## Beyond State Management in #Pinia by Eduardo San Martin

- https://www.youtube.com/watch?v=zYuRBtFrJwg

### MarkRaw

- [12:34](https://youtu.be/zYuRBtFrJwg?t=754)

You shoudld use `markRaw()` to avoid deeply pbserving complex objects

## #Pinia Disasterclass by Eduardo San Martin Morote, Vue.js Nation 2024

- :tv: https://www.youtube.com/watch?v=D61hGeliypY
- :newspaper: [Top 5 mistakes to avoid when using Pinia - Mastering Pinia Blog](https://masteringpinia.com/blog/top-5-mistakes-to-avoid-when-using-pinia)

### Insecure state pollution

Don't call `useMyStore()` inside of fn or `watch`. Only top level setup script or router navigation guards.

### `reactive` vs `ref`

Reactive objects cannot be reassigned but reactive can.

```ts
items = reactive(new Set())
// . . . . .
store.items.clear()
```

### Don't overuse

- We should not look for the store as primary source to store the global state. The router comes first.

```ts
const list = reactive(new Map())

watch(
	() => route.params.id,
	async (id) => {
		const project = await fetch('...'). // . . . .
		list.set(id, project)
	}
)
```

Use ___composable___ singletones as way to encapsulate global stateful logic (see [definition](https://vuejs.org/guide/reusability/composables.html#what-is-a-composable) in vue docs). Composable which uses small store inside.

### Advantage to use Pinia over composables

Share state over multiple components. Debug tools. Plugins. SSR issues solved.


## Proven Pinia Patterns - Adam Jahr - VueConf US 2023

- https://www.youtube.com/watch?v=AkZwXJ2BD_k

- Options vs Setup API?
	- Setup
		- :sparkles: composables (VueUse), can use watchers
		- :microbe: No `.$reset()` method available, need to write it manually
- vs VueX
	- separate small stores adds clarity to debugging
- Nested stores
	- import one store into another, run `useAnotherStore()` in setup function
- Destruct with `storeToRefs`!

```vue
<script setup>
// . . . . .
geoLocStore = useGeoLocStore()
const { city } = storeToRefs(geoLocStore)
</script>
<template>
	<imput v-model="city" />
</template>
```

## 5 Elegant ways to use Pinia / Eduardo San Martin Morote

- https://www.youtube.com/watch?v=23jJAN44Fu4
- (usage with router)

```ts
pinia.use(({ store }) => {
	store.router = markRaw(router)
})

declare module 'pinia' {
	interface PiniaCustomProperties {
		router: Router
	}
}
```

```ts
router.beforeEach(to => {
	if (to,meta.requiresAuth) {
		const userStore = useUserStore(pinia)
		if (!userStore.user) {
			return '/login'
		}
	}
})
```


```ts
createApp(app).use(pinia).use(router).mount('#app')
```