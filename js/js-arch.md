# JS app architecture

## What are the use cases for dynamic imports

- Import a module on-demand or conditionally. For example, if you want to load a polyfill on legacy browser
- Compute the module specifier at runtime. For example, you can use it for internationalization.

```js
if (isLegacyBrowser()) {
    import(···).then(···);
}

import(`messages_${getLocale()}.js`).then(···);
```

https://github.com/sudheerj/javascript-interview-questions#what-are-the-use-cases-for-dynamic-imports

## What are the advantages of module loaders

The module loaders (RequireJS, SystemJS...) provides the below features:

- Dynamic loading
- State isolation
- Global namespace isolation
- Compilation hooks
- Nested virtualization

- https://byby.dev/js-module-loaders