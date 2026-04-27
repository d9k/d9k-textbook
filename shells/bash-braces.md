# Bash: braces, parantheses

## bash - How to use double or single brackets, parentheses, curly braces | SO

https://stackoverflow.com/questions/2188199/how-to-use-double-or-single-brackets-parentheses-curly-braces/8552128#8552128

## Curly Braces

```
${variable}                            # Parameter substitution
${!variable}                           # Indirect variable reference
{ command1; command2; ...; commandN; } # Block of code
{string1,string2,string3,...}          # Brace expansion
{a..z}                                 # Extended brace expansion
{}                                     # Text replacement, after find and xargs
```

## Parentheses

```
( command1; command2 )             # Block of code executed within a subshell
Array=(element1 element2 element3) # Array initialization
result=$(COMMAND)                  # Command substitution, new style
>(COMMAND)                         # Process substitution
<(COMMAND)                         # Process substitution
```
