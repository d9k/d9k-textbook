# CSS: specificity

 - :beginner: [Specificity - CSS: Cascading Style Sheets | MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/CSS_cascade/Specificity)

Specificity is an `[ID - CLASS - TYPE]` tuple.

```css
[type="password"] {
  /* 0-1-0 */
}
input:focus {
  /* 0-1-1 */
}
:root #myApp input:required {
  /* 1-2-1 */
}
```

The weight is determined by comparing the values in the three columns, from left to right.

The matches-any pseudo-class `:is()`, the relational pseudo-class `:has()`, and the negation pseudo-class `:not()` are not considered as pseudo-classes in the specificity weight calculation. They themselves don't add any weight to the specificity equation. However, the selector parameters passed into the pseudo-class parenthesis are part of the specificity algorithm

```css
:is(p) {
  /* 0-0-1 */
}

h2:nth-last-of-type(n + 2) {
  /* 0-1-1 */
}
h2:has(~ h2) {
  /* 0-0-2 */
}

div:not(.inner) p {
  /* 0-1-2 */
}
```