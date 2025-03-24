# Bash: modules

## Aliases not loaded

```
shopt -s expand_aliases

if [ -f ./.aliases.inc.sh ]; then
    . ./.aliases.inc.sh
fi
```
