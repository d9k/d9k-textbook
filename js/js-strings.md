# JS string

- [JS strings Jupyter Notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-strings.ipynb)

## 3 ways to check for substring

```js
> 'javascript'.includes('script')
true
> 'javascript'.includes('robustness
false
> 'javascript'.indexOf('script') !== -1 /* es6 */
true
> 'javascript'.indexOf('robustness') !== -1
false
> (/script/).test('javascript')
true
> (/robustness/).test('javascript')
false
```

## Parse query string

```
var p = new URLSearchParams('animals=whale&animals=rabbit&age=5');
console.log(p.getAll('animals'));
console.log(p.get('age'));
```

## Links

[^1]: [js stupid qustions jupiter notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-stupid-questions.ipynb)