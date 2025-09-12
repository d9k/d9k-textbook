# Vue: slots

## Slots | Vue.js

https://vuejs.org/guide/components/slots.html

### Using slot

```vue
<template v-slot:footer>
	<p>Here's some contact info</p>
</template>
```

or

```vue
<template #footer>
	<p>Here's some contact info</p>
</template>
```

### Conditional slots

```vue
<div v-if="$slots.footer" class="card-footer">
  <slot name="footer" />
</div>
```

### Slots scope

- :beginner: [Slots | Vue.js](https://vuejs.org/guide/components/slots.html#scoped-slots)

Declaration:

```vue
<div>
	<slot :text="greetingMessage" :count="1"></slot>
</div>
```

Usage:

```vue
<MyComponent v-slot="{ text, count }">
	{{ text }} {{ count }}
</MyComponent>
```

Named scoped slots declaration:

```vue
<slot name="header" pageTitle="pageTitle" breadcrumbs="breadcrumbs"></slot>
```

Named scoped slots usage:

```vue
<MyComponent>
  <template #header="{ pageTitle, breadcrumbs }">
    {{ headerProps }}
  </template>
```