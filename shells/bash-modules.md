# Bash: modules

## Check module not executed directly

```bash
if [ ${0##*/} == ${BASH_SOURCE[0]##*/} ]; then
    echo "This script is not meant to be executed directly!"
    echo "Use this script only by sourcing it."
    exit 1
fi
```

## Aliases not loaded

```bash
shopt -s expand_aliases

if [ -f ./.aliases.inc.sh ]; then
    . ./.aliases.inc.sh
fi
```
