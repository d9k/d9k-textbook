# Bash: strings

## Truncate/limit lines

to 500 chars:

`| awk '{print substr($0, 1, 500)}`

## Get first letter

```bash
echo -e "This\nis\nmultiline string" | head -n 1 | cut -c1-1
```
