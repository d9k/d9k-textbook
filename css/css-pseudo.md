# CSS: псевдоэлементы и псевдоселекторы

## CSS pseudo-elements and discuss what they are used for

`:first-line`, `:first-letter`, `:marker`, `:selection` - styling.
`:before`, `:after` - adding elements to markup

## CSS pseudo classes

pseudo classes (begin with `:`)

**Functional**: `is()` (one of list), `not()`, `where()`, `has()`.

**User action**: `hover`, `active` (activated by user), `focus`, `focus-visible` (browser recommends focus to be visible based on device and circumstances), `focus-within`.

**DOM Tree-structural**: `root`, `empty`, `nth-child()`, `nth-last-child()`, `first-child()`, `last-child`, `only-child` (no siblings), `nth-of-type()`, `nth-last-of-type()`, `first-of-type()`, `last-of-type()`, `only-of-type()`.

**Input**: `autofill` (was filled by browser), `enabled`, `disabled`, `read-only`, `read-write` (editable), `placeholder-shown`, `default` (def. option), `checked`, `indeterminate`, `blank` (empty), `valid`, `invalid`, `in-range`, `out-of-range`, `required`, `optional`, `user-invalid`.

**Display state**: `fullscreen`, `modal`, `picture-in-picture`.

**Linguistic**: `dir()` (direction), `lang()` content language.

**Location**: `any-link`, `link`, `visited`, `local-link`, `target`, `target-within`, `scope`.

**Resource state**: `playing`, `paused`.



https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes