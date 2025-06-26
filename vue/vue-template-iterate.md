# Vue: template: iterate

## v-for

- :beginner: [List Rendering | Vue.js](https://vuejs.org/guide/essentials/list)

### v-for in/for array

Options API definition:

```js
data() { return { items: [{ message: 'Foo' }, { message: 'Bar' }] } }
```

Composition API definition:

```js
const items = ref([{ message: 'Foo' }, { message: 'Bar' }])
```

Template:

```vue
<li v-for="item in items"> {{ item.message }} </li>
<li v-for="item of items"> {{ item.message }} </li>

<li v-for="(item, index) in items">
  {{ index }}. {{ item.message }}
</li>
```

### v-for for objects

```js
const myObject = reactive({
  title: 'How to do lists in Vue',
  author: 'Jane Doe',
  publishedAt: '2016-04-10'
})
```

```vue
<ul> <li v-for="value in myObject"> {{ value }} </li> </ul>

<ul>
  <li v-for="(value, key) in myObject"> {{ key }}: {{ value }} </li></ul>
```

### v-for with template / component

Key is required!

```vue
<template v-for="todo in todos" :key="todo.name">
  <li>{{ todo.name }}</li>
</template>
```

### v-for with v-if

This will throw an error because property "todo"
is not defined on instance:

```vue
<!--
<li v-for="todo in todos" v-if="!todo.isComplete">
  {{ todo.name }}
</li>
-->
```

To filter items in a list (e.g. `v-for="user in users" v-if="user.isActive"`). In these cases, replace `users` with a new computed property that returns your filtered list (e.g. `activeUsers`).