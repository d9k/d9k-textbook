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