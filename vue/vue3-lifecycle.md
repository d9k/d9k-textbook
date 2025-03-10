# Vue 3: lifecycle

- :beginner: [Composition API: Lifecycle Hooks | Vue.js](https://vuejs.org/api/composition-api-lifecycle)

- `onBeforeMount()`: right before the component is to be mounted (the component has finished setting up its reactive state)
- `onMounted()`: after the component has been mounted (DOM tree has been created and inserted into the parent container).
- `onBeforeUpdate()`: right before the component is about to update its DOM tree
- `onUpdated()​`: after the component has updated its DOM tree due to a reactive state change.
- `onBeforeUnmount()` - right before a component instance is to be unmounted
- `onUnmounted()`: after the component has been unmounted

- `onErrorCaptured()` - when an error propagating from a descendant component has been captured.

- development-mode-only
	- `onRenderTracked() `
		- when a reactive dependency has been tracked by the component's render effect.
	- `onRenderTriggered()`
		- when a reactive dependency triggers the component's render effect to be re-run.