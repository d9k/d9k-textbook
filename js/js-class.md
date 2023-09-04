# JS: Class

See also [js objects](./js-objects.md), [js prototype](./js-prototype.md).

## Prototypes and classes

In ES6, Javascript classes are primarily syntactic sugar over JavaScript’s existing prototype-based inheritance.

```js
class Bike {
  constructor(color, model) {
    this.color = color;
    this.model = model;
  }

  getDetails() {
    return this.model + " bike has" + this.color + " color";
  }
}
```

the same as

```js
function Bike(model, color) {
  this.model = model;
  this.color = color;
}

Bike.prototype.getDetails = function () {
  return this.model + " bike has" + this.color + " color";
};
```
