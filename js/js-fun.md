# JS: functional programming

## bind to 2-nd arg

```
_ = require('lodash');

skipArg = _.bind.placeholder
thisAsNull = null

let concat = function(a, b, c) {
    return a + '' + b + c;
}

console.log( concat(1,2,3) ); // '123'

_concat1 = _.bind(concat, thisAsNull, 1);
console.log( _concat1(2,3) ); // '123'

_concat2 = _.bind(concat, thisAsNull, skipArg, 2);
console.log( _concat2(1,3)); // '123'

_concat3 = _.bind(concat, thisAsNull, skipArg, skipArg, 3);
console.log(_concat3(1,2)) // '123'
```

## map и filter одновременно

`reduce`
`flatMap` - может требовать `polyfill`
