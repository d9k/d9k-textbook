# Vue CSS selectors

## css - How do I use /deep/ or >>> or ::v-deep in Vue.js? | SO

- https://stackoverflow.com/questions/48032006/how-do-i-use-deep-or-or-v-deep-in-vue-js/55368933#55368933

- Vue 3:
	- `:slotted(.slot-class)` - styling passed slot content
	- `:global(.my-class)`
	- `:deep(.child-class)`
			- [Deep Selectors | Scoped CSS | Vue Loader](https://vue-loader.vuejs.org/guide/scoped-css.html#deep-selectors)