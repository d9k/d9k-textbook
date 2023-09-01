# JS events

## touch events order

```
touchstart
touchmove
touchend
mouseover
mousemove
mousedown
mouseup
click
```

https://stackoverflow.com/a/41455044

## Node.js EventEmitter

```
> e.addListener('newListener', () => console.log('newListener'))
> e.addListener('event1', () => console.log('event1'))
newListener
> e.emit('event1')
event1
> events.EventEmitter.listenerCount(e, 'event1')
1
```

https://github.com/LeCoupa/awesome-cheatsheets/blob/master/backend/node.js

## What is the use of preventDefault method

The `event.preventDefault()` method if `event` cancellable prevents default event behaviour. For example, prevent form submission when clicking on submit button.

Not all events are cancelable.

## Event flow

Before your click actually reaches the target element, it must trigger the click event for each of its parent elements first, starting from the `window` object.

There are two ways of event flow:

- Top to Bottom (Event Capturing) or root to leaf
- Bottom to Top (Event Bubbling) or leaf to root

![Event phases|250](https://i.stack.imgur.com/liJ5u.png)

## addEventListener

```
addEventListener(type, listener)
addEventListener(type, listener, options)
addEventListener(type, listener, useCapture)

options: {
	capture, /* capture on 1-st event phase (from root to leaf) */
	once, /* remove after first call */
	passive, /* performance optimizations, but preventDefault() calls ignored */ 
	signal /* AbortSignal */*
}
```

- [addEventListener | MDN](https://developer.mozilla.org/en-US/docs/Web/API/EventTarget/addEventListener)

- https://stackoverflow.com/questions/7398290/unable-to-understand-usecapture-parameter-in-addeventlistener

## Разница событий `load` и `DOMContentLoaded`

The `document` `DOMContentLoaded` event is fired when the initial HTML document has been completely loaded and parsed, without waiting for assets to finish loading. Whereas The `window` `load` event is fired when the whole page has loaded, including all dependent resources(stylesheets, images).

## What is the use of stopPropagation method

The `stopPropagation()` method is used to stop the event from bubbling up the event chain.

## `return false` in event

The `return false` statement in event handlers performs the below steps,

1. First it stops the event default behaviour.
2. It prevents the event from propagating the DOM
3. Stops callback execution and returns immediately when called.
## Event delegation

Event delegation is a technique for listening to events where you delegate a parent element as the listener for all of the events that happen inside it.

```
form.addEventListener(
  "input",
  function (event) {
    console.log(event.target);
  },
  false
);
```



