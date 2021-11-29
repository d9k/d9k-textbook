# Git problems

## Github ssh clone: Could not resolve hostname github.com: Name or service not known

`ssh -T git@github.com`

## Empty objects

```
find .git/objects -empty -type f
find .git/objects -empty -type f -delete
git fsck --full
git fetch
```

https://stackoverflow.com/a/40098509/1760643
