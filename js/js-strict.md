# JS strict mode

Strict mode throws errors:
* accidentally creating a global variable
* assignment to a non-writable / getter-only / non-existent property
* assignment to non-existing variable / object
* 0-prefixed octal literals (need `0o` prefix)
* setting properties on primitive values
* duplicate property names
* `with` statement
* accessing caller or arguments of function
* deleting variable (assign `= null` instead).

Also:
* Vars declared in eval don't leak outside.
* Extra reserved words.

``"use strict"`` can be added to function or to the script top.

JavaScript modules (`import`/`export`)  are automatically in _strict mode_.

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Strict_mode