# JS string

- JS strings Jupyter Notebook [^j]

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

## What are regular expression patterns

Регулярное выражение это последовательность символов, задающая шаблон для поиска.

## ### What are modifiers in regular expression

## What are modifiers in regular expression

- `i` - case-insensitive matching
- `g` - global match (all matches).
- `m` - multiline matching. Only affects the behavior of `^` and end `$`.

See jupiter notebook [^j] for example.

## What are regular expression patterns

- I. **Brackets:**
    - `[abc]`: any of the characters (a/b/c)
    - `[^abc]`: all characters except these
    - `[0-9]`: symbol range
    - `(cat|dog)`: any of the alternatives separated with `|`
    - `x(?=y)` - Lookahead assertion: Matches "x" only if "x" is followed by "y".
    - `x(?!y)` - Negative lookahead assertion.
    - `(?<=y)x` - Lookbehind assertion.
    - `(?<!y)x` - Negative lookbehind assertion.
    - `\k<Name>` -  Named capture group. Example: `/(?<title>\w+), yes \k<title>/` matches `"Sir, yes Sir"`
    - [Regex Groups and backreferences - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Groups_and_backreferences)
    - [Regex Assertions - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions#other_assertions)

```
var text = '[He] ha[s] to go read this novel [Alice in Wonderland].';

console.log(text.match(/\[.*?\]/g));
console.log(text.match(/\[.*\]/g));
```

- II. **Metacharacters:**
	- `.`: - any character except the newline `\n`.
    - `\d`: digit
    - `\s`: whitespace character
    - `\b`: beginning or ending of a word (**b**oundary)
    - `\`: escape character: Example: `\\`, `\.`
    - [Regex Character classes - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Character_classes)
- III. **Quantifiers:**
    - `a+`: c >= 1
    - `a*`: c >= 0
    - `a?+`
    - `a?`: 0 <= c <= 1
    - `a{n,}`: c >= n
    - `a{n,m}`: n <= c <= m
    - [Regex Quantifiers - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Quantifiers)
- IV. **Assertions**
	- `^` - начало строки
	- `$` - конец строки
	- `\b` - начало или конец слова (word **b**oundary)
	- `\B` - ожидается продолжение слова (НЕ начало или конец слова)
	- [Regex Assertions - JavaScript | MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions/Assertions)
- https://cheatdumper.blogspot.com/2019/10/regex-javascript-cheat-sheet.html

## Links

[^j]: [JS strings Jupyter Notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-strings.ipynb)
