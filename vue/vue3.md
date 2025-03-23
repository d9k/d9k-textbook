# #Vue3

- https://vueschool.io/articles/vuejs-tutorials/faster-web-applications-with-vue-3/

`Vue.set()`/`Vue.delete()` (only in 2.x compatibility builds)

## Composition API vs. Mixins

- :beginner: [vs. Mixins | Comparisons with Other Techniques​ | Composables | Vue.js](https://vuejs.org/guide/reusability/composables.html#what-is-a-composable)
- **Implicit cross-mixin communication**: multiple mixins that need to interact with one another have to rely on shared property keys, making them implicitly coupled.
- **Namespace collisions**: multiple mixins from different authors can potentially register the same property keys, causing namespace collisions.
- **Unclear source of properties**: when using many mixins, it becomes unclear which instance property is injected by which mixin, making it difficult to trace the implementation and understand the component's behavior. Alternative: composables + destructure.


## Composition API vs Renderless components

- [Renderless components | Slots | Vue.js](https://vuejs.org/guide/components/slots#renderless-components)

```vue
<MouseTracker v-slot="{ x, y }">
  Mouse is at: {{ x }}, {{ y }}
</MouseTracker>
```

Components that only encapsulate logic and do not render anything by themselves.

While an interesting pattern, most of what can be achieved with Renderless Components can be achieved in a more efficient fashion with Composition API, without incurring the overhead of extra component nesting.

```ts
const { x, y } = useMouse()
```

```ts
export function useMouse() {
  const x = ref(0), y = ref(0)

  function update(event) {
    x.value = event.pageX
    y.value = event.pageY
  }

  onMounted(() => window.addEventListener('mousemove', update))
  onUnmounted(() => window.removeEventListener('mousemove', update))

  return { x, y }
}
```

## [Can I use both APIs in the same component?](https://vuejs.org/guide/extras/composition-api-faq#can-i-use-both-apis-in-the-same-component)

Yes. You can use Composition API via the [`setup()`](https://vuejs.org/api/composition-api-setup) option in an Options API component.

## Vue compositions VS React Hooks

- React Hooks are invoked repeatedly every time a component updates. This creates a number of caveats that can confuse even seasoned React developers. It also leads to performance optimization issues that can severely affect development experience.
- Hooks are call-order sensitive and cannot be conditional
- Variables declared in a React component can be captured by a hook closure and become "stale" if the developer fails to pass in the correct dependencies array. This leads to React developers relying on ESLint rules to ensure correct dependencies are passed.
- Event handlers passed to child components cause unnecessary child updates by default, and require explicit `useCallback` as an optimization which again requires a correct dependencies array.

Vue Composition API:

- Invokes `setup()` or `<script setup>` code only once.
- Vue's runtime reactivity system automatically collects reactive dependencies.

However React Hooks was a major source of inspiration for Composition API.

## :robot_face: Vue3 переусложнённые composables / чат DeepSeek 2025.03.22

- Разделяйте логику на атомарные composables - SRP
- Инкапсулируйте зависимости
Передавайте внешние сервисы через параметры, а не импортируйте напрямую. (Не прячьте контекст, например, provide/inject внутри composables).
- Используйте композицию \[в компоненте\], а не наследование \[не композицию внутри composables\]
Собирайте функционал из мелких composables в компонентах:
- Избегайте бизнес-логики в composables
Выносите её в отдельные слои (например, domain-сервисы):
- Документирование: четко описывайте, какие побочные эффекты вызывает функция, что принимает и возвращает.