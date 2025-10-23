# VueX

Обучающее видео
https://www.youtube.com/watch?v=c2SK1IlmYL8

## Call another store module

### Mutate another module

```js
commit('someMutation', null, { root: true }) // -> 'someMutation'
```

### Call action from another module

```
namespaced: true
```

```js
dispatch('notification/triggerSelfDismissingNotifcation', { value1: … }, { root: true })
```

### Use another model getter

```js
getters: {
    someGetter (state, getters, rootState, rootGetters) {
		rootGetters['bar/someOtherGetter']
	}
}
actions: {
	someAction ({ dispatch, commit, getters, rootGetters }) {
		rootGetters['bar/someGetter']
	}
```


:speech_balloon: [javascript - How to access the getter from another vuex module? | SO](https://stackoverflow.com/questions/45999623/how-to-access-the-getter-from-another-vuex-module)