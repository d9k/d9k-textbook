# Vue: modifiers

[Работа с формами | Vue.js](https://ru.vuejs.org/guide/essentials/forms.html#modifiers)

`.lazy` - синхронизация по событию `change` вместо `input`.

```vue
<input v-model.lazy="msg" />
```

`.trim` - удаление пробельных символов в начале/конце.
`.number` - автоприведение значения к числу.
