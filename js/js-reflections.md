## JS: reflections

- See js reflections jupyter notebook [^1]

## Get the number of parameters expected by a function

```js
function sum4(num1, num2, num3, num4) {
  return num1 + num2 + num3 + num4;
}
sum4.length
```

Result: `4`

## Get all properties including inherited

Use `Object.getOwnPropertyNames(obj);` and `Object.getPrototypeOf(obj)`.

See function implementation in jupiter notebook[^1].

## Links

[^1]: [js reflection jupiter notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-reflections.ipynb)