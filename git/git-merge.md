# Git: merge

## git mergetool again

`git checkout --merge <file>`

https://stackoverflow.com/a/6865041/1760643

## `ours`/ `theirs`

- :speech_balloon: [merge - What is the precise meaning of "ours" and "theirs" in git? | SO](https://stackoverflow.com/questions/25576415/what-is-the-precise-meaning-of-ours-and-theirs-in-git)

Ultimately, during a git merge, the "ours" branch refers to the branch you're merging into:

```
git checkout merge-into-ours
```

and the "theirs" branch refers to the (single) branch you're merging:

```
git merge from-theirs
```

 If you do a re-base instead of a normal merge, the roles are swapped.

