# JS events

## touch events order

touchstart
touchmove
touchend
mouseover
mousemove
mousedown
mouseup
click

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
