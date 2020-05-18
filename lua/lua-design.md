Why Lua design is so?
=====================

## No += operator

https://www.reddit.com/r/lua/comments/2p1ndv/why_are_there_no_shorthand_for_incrementing/cmu53qu/

munificent 5 points 2 years ago* 
One wrinkle to keep in mind is that Lua (the main implementation) is a single-pass compiler. It converts your Lua source code into bytecode directly while it's parsing the code, with no intermediate representation or extra passes over the output. That makes some things difficult to implement without dramatically changing the compiler.
Self-assignment operators, especially when you consider non-trivial lvalues like foo.bar[baz] += 3 are probably hard to generate bytecode for with just one pass over the source. You have to emit the bytecode for the load (so foo.bar[baz]), then the bytecode for the right-hand side (3), then go back and emit the bytecode for the store (foo.bar[baz] =).
This is trivial in a language implementation that parses to an AST and lets you rewrite the AST before code generation. But Lua doesn't roll that way.
It's also worth noting that assignment is a statement in Lua, not an expression. Allowing an assignment in an expression context is another example of something that's a lot trickier in a single pass compiler. So, even if they added self-assignment operators, they'd still be less flexible than you're used to from other languages since they could only happen in statement position.
Edit: after looking at this patch it looks like it's more straightforward than I feared. In that case, it may just be more of a case of the Lua maintainers trying to keep things as simple and minimal as possible.

## Why arrays start from 1

* johannes_lalala

```
nextday = day[(i+1)%7]  as it is in almost every other language
```
Than:

```
nextday = day[i%7+1] as it is in lua
```

http://stackoverflow.com/a/18077350/1760643

* Mark Rushakoff

Anyway, there are a couple conveniences to using 1-based indexing. Namely, the # (length) operator: t[#t] access the last (numeric) index of the table, and t[#t+1] accesses 1 past the last index. To someone who hasn't already been exposed to 0-based indexing, #t+1 would be more intuitive to move past the end of a list. There's also Lua's for i = 1,#t construct, which I believe falls under the same category as the previous point that "1 to the length" can be more sensible than indexing "0 to the length minus 1".

http://stackoverflow.com/a/2785765/1760643

## Complete syntax

http://www.lua.org/manual/5.1/manual.html#8
http://www.lua.org/manual/5.3/manual.html#9

## Why variables are global by default?

http://lua-users.org/wiki/ScopeTutorial
    has strict.lua
    http://lua-users.org/wiki/DetectingUndefinedVariables
http://lua-users.org/wiki/LocalByDefault

## Why goto added on 5.2?

http://lua-users.org/wiki/GotoStatement