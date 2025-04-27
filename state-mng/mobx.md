# MobX

MobX can be used to create classes with autocalc fields and effects based on fields values.

## `observable.box()`

All primitive values in JavaScript are immutable and hence per definition not observable. In rare cases it can be convenient to have an observable "primitive" that is not owned by an object. For these cases it is possible to create an observable box that manages such a primitive.

 - :beginner: [boxed values · Mobx Doc](https://iiunknown.gitbooks.io/mobx-doc/content/refguide/boxed.html#observableboxvalue)

## `reaction()`, `when()`

- :beginner: [Running side effects with reactions ·| MobX docs](https://mobx.js.org/reactions.html#reaction)

## :stethoscope: #DevTools

- [mobx-devtools-pro](https://github.com/mobx-devtools/mobx-devtools-pro) by [mobx-devtools](https://github.com/mobx-devtools)
	- _The official Mobx Devtools enhanced version._
	- :tv: [ Mobx простым языком - Удобный инструмент разработчика, как в Redux | Дмитрий Герасимов | YT](https://www.youtube.com/watch?v=OXzwVK-SbJc)