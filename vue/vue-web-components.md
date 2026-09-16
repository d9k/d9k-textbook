# Vue + Web components

## Vue and Web Components | Vue guide

https://vuejs.org/guide/extras/web-components.html

Vue scores a perfect 100% in the Custom Elements Everywhere tests. Consuming custom elements inside a Vue application largely works the same as using native HTML elements, with a few things to keep in mind:

Skipping Component Resolution​: By default, Vue will attempt to resolve a non-native HTML tag as a registered Vue component before falling back to rendering it as a custom element. This will cause Vue to emit a "failed to resolve component" warning during development. To let Vue know that certain elements should be treated as custom elements and skip component resolution, we can specify the `compilerOptions.isCustomElement` option.