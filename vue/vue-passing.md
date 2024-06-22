# Vue: передача атрибутов и значений

## Passing all properties at once

  https://alligator.io/vuejs/passing-multiple-properties/
- [Binding Multiple Properties Using an Object | Props | Vue.js](https://vuejs.org/guide/components/props.html#binding-multiple-properties-using-an-object)

`v-bind="$attrs"`
`v-bind="$props"`

`v-bind="{...$attrs, ...$props}"`

## Passing some properties

`<component-a v-bind="{ title: title, show: show, other: other }"></component-a>`

## Assign event listeners to non-root node

```vue
<div class="my-textarea-wrapper">
  <textarea v-on="$listeners" ></textarea>
</div>
```
