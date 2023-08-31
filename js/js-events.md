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
## Разница событий `load` и `DOMContentLoaded`

The `document` `DOMContentLoaded` event is fired when the initial HTML document has been completely loaded and parsed, without waiting for assets to finish loading. Whereas The `window` `load` event is fired when the whole page has loaded, including all dependent resources(stylesheets, images).