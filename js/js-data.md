# JavaScript: типы данных и манипуляции с ними

- JS data Jupyter Notebook [^j]

## How do you compare Object and Map?

1. The keys of an Object are Strings and Symbols, whereas they can be any value for a Map, including functions, objects, and any primitive.
2. Map: свойство size.
3. Map: ключи в порядке вставки
4. Map: iterable
5. Object есть существующие поля прототипа, если не Object.create(null)
6. Map быстрее при множестве добавлений/удалений пар значений

## WeakSet: what for?

- When you need to keep an arbitrary collection of things but you don't want to prevent those things from being garbage-collected.
- But you can't iterate over a list of entries
- To avoid _any_ object to be visited/setup twice (Circular references, mixins, source files, `<iframe>`'s...)
- Access control and validation.
- \[I think it's best to use WeakSet when possible to reduce functions side effects and reduce unexpected bugs\]

- https://esdiscuss.org/topic/actual-weakset-use-cases
- https://stackoverflow.com/questions/30556078/ecmascript-6-what-is-weakset-for

## WeakMap: what for?

- Let’s say that we have a bunch of buttons on the DOM, and we want to keep track of how many times each button has been pressed by a user.
	- https://javascript.plainenglish.io/weakmaps-illustrated-8169ce4764bb
- WeakMap for Private data
	- https://2ality.com/2016/01/private-data-classes.html#keeping-private-data-in-weakmaps

## Wrapper objects

When we treat a primitive value like it was an object (i.e. by accessing properties and methods), JavaScript creates, under the hood, a wrapper to wrap this value and expose it as an object. The JS engine never reuses a wrapper object, giving them to the garbage collector right after a single use.

You can't directly add and call method to string variable, but you can do this with `String(strValue)` wrapper object.

- https://programmingwithmosh.com/javascript/javascript-wrapper-objects/

## Links

[^j]: [js data jupiter notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-data.ipynb)