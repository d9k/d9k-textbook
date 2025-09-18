# Vue: v-model

## Composition v-model

```vue
<Child v-model="countModel" />
```

Child component:

```vue
<script setup>
const model = defineModel()

function update() {
  model.value++
}
</script>

<template>
  <div>Parent bound v-model is: {{ model }}</div>
  <button @click="update">Increment</button>
</template>
```

The value returned by `defineModel()` is a ref. It can be accessed and mutated like any other ref. When it is mutated by the child, it causes the parent bound value to be updated as well.

```vue
<UserName
  v-model:first-name="first"
  v-model:last-name="last"
/>
```

```vue
<script setup>
const firstName = defineModel('firstName')
const lastName = defineModel('lastName')
</script>

<template>
  <input type="text" v-model="firstName" />
  <input type="text" v-model="lastName" />
</template>
```

`defineModel` is a convenience macro. The compiler expands it to the following:

A prop named `modelValue`, which the local ref's value is synced with;
An event named `update:modelValue`, which is emitted when the local ref's value is mutated. So

```vue
<input v-model="model" />
```

is

```vue
<input :value="props.modelValue" @input="emit('update:modelValue', $event.target.value)" />
```

## Component v-model

### Native elements

```vue
<input v-model="searchText" />
<!-- Same as: -->
<input
  :value="searchText"
  @input="searchText = $event.target.value"
/>
```

### Custom components

```vue
<CustomInput v-model="searchText" />
```

Same as:

```vue
<CustomInput
  :model-value="searchText"
  @update:model-value="newValue => searchText = newValue"
/>
```

Custom component must implement value handling like this:

```js
<input
    :value="modelValue"
	 @input="$emit('update:modelValue', $event.target.value)"
/>
```

### Custom component with custom property name

```vue
<MyComponent v-model:title="title"
```

Custom component with custom property name must implement value handling like this:

```vue
<input
    type="text"
    :value="title"
    @input="$emit('update:title', $event.target.value)"
/>
```
