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

## What is `EventEmitter.call(this)`?

- :speech_balloon: [javascript - What is Event Emitter Call? | SO](https://stackoverflow.com/questions/30684966/what-is-event-emitter-call#comment82516397_30684966)

Means extends NodeJS [EventEmitter](https://nodejs.org/docs/latest/api/events.html).
Package for browsre: [eventemitter3](https://github.com/primus/eventemitter3)