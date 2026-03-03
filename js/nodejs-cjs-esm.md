# NodeJS: CommonJS vs ESM

## CommonJS

`require`, `module.exports`, `exports`
Extensions: `.js`

- :speech_balloon: [javascript - Importing CommonJS modules to an ESM syntax | SO](https://stackoverflow.com/questions/70399241/importing-commonjs-modules-to-an-esm-syntax)

```
import urlMetadata from 'url-metadata';
```

is syntactic sugar for

```
import { default as urlMetadata } from 'url-metadata';
```

## ESM:

`import`, `export`, `export default`
Extensions: `.mjs` / `.ts`

## Async import

Async import - единственный способ импортировать

```js
(async () => {
  if (somethingIsTrue) {
    const {
      default: myDefault,
      foo,
      bar,
    } = await import("/modules/my-module.js");
  }
})();
```

[import() - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/import)

## Взаимодействие и использование обоих стандартов импорта зависимостей

- :newspaper: [Conditional Exports: Supporting both import and require()](https://bnb.im/posts/conditional-exports-supporting-both-import-and-require/)
- :speech_balloon: [javascript - Babel 6 changes how it exports default | SO](https://stackoverflow.com/questions/33505992/babel-6-changes-how-it-exports-default)
	- :jigsaw: [babel-plugin-add-module-exports - npm](https://www.npmjs.com/package/babel-plugin-add-module-exports)