# Vue 3: reactivity

## `reactive()` vs `ref()`

- :speech_balloon: [vuejs3 - ref vs reactive in Vue 3? | SO](https://stackoverflow.com/questions/61452458/ref-vs-reactive-in-vue-3)

- `reactive()` only takes objects, **NOT** JS primitives _(`String`, `Boolean`, `Number`, `BigInt`, `Symbol`, `null`, `undefined`)_
- `ref()` is calling `reactive()` behind the scenes
- `ref()` has a `.value` property for reassigning, `reactive()` does not have this and therefore CANNOT be reassigned

Use `reactive()` when it's an object you don't need to reassign, and you want to avoid the overhead of `ref()`.

You'll always use `ref()` for primitives, but `ref()` is good for objects that need to be reassigned, like an array.

- `ref([])` in a `setup()` function; `isReactive(x)` returns `false`, while `isRef(x)` returns `true`

## `computed()` vs `toRef()`

`computed()​` - takes a getter function and returns a readonly reactive ref object for the returned value from the getter.

`toRef()` - can be used to create a ref for a property on a source reactive object. The created ref is synced with its source property: mutating the source property will update the ref, and vice-versa.

- [toRef | Reactivity API: Utilities | Vue.js](https://vuejs.org/api/reactivity-utilities#toref)

- [feat(reactivity): improve support of getter usage in reactivity APIs by yyx990803 · Pull Request #7997 · vuejs/core](https://github.com/vuejs/core/pull/7997)
	- _Internally, `computed` creates a separate effect to cache the computation. This actually is largely overhead when the getter is simply accessing properties and not performing any expensive computations_
	- `toRef()` - invoked getter on every `.value` access?

### When `toRefs()` needed?

For props seems better just use `props.${prop_name}` for every field

- [no-setup-props-reactivity-loss ESLint rule](https://eslint.vuejs.org/rules/no-setup-props-reactivity-loss)