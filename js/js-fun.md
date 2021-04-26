# JS: functional programming

## bind to 2-nd arg

```
_ = require('lodash');

let concat = function(a, b, c) {
    return a + '' + b + c;
}

console.log( concat(1,2,3) ); // '123'

_concat1 = _.bind(concat, null, 1)\
console.log( _concat1(2,3) ); // '123'

_concat2 = _.bind(concat, null, _, 2)
console.log( _concat2(1,3)); // '123'

_concat3 = _.bind(concat, null, _, _, 3)
console.log(_concat3(1,2)) // '123'
```
