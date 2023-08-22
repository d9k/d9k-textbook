# JS: prototype

## Why use prototype

Using the prototype makes faster object creation since properties/methods on the prototype don't have to be re-created each time a new object is created.

`this.myMethod = /* ... */` => method is created every time you create an object.

`MyClass.prototype.myMethod = /* ... */` => created once.

https://stackoverflow.com/a/8433493

## Property lookup

`myObj.myMethod()` - first looks at the `myObj` object to see if it has a property with the name `myMethod`. If it doesn't, the engine looks the the prototype object for `myObj` to see if _it_ has a property with that name.

JS doesn't have method overloading.

https://stackoverflow.com/a/18402468

## Difference with inheritance

That prototype object has a prototype of its own, and so on until an object is reached with `null` as its prototype. By definition, `null` has no prototype, and acts as the final link in this **prototype chain**.

It is possible to mutate any member of the prototype chain or even swap out the prototype at runtime, so concepts like static dispatching do not exist in JavaScript.

(Static dispatch is a form of polymorphism fully resolved during compile time.)

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Inheritance_and_the_prototype_chain
## Prototype chaining vs prototype shadowing

Prototype shadowing is when a property or method conceals access to an equivalently named one on a superclass, and prototype chaining is simply jargon for prototypal inheritance in object-oriented programming.

https://stackoverflow.com/questions/50443926/what-is-difference-between-prototype-shadowing-and-prototype-chaining-in-javascr#comment87901732_50443926