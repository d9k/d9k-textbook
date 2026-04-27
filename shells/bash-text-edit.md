# bash: text edit

## Удалить кавычки

```bash
echo -n '"abcdefg"' | tail -c +2 | head -c -2
```

## Truncate/limit lines

to 500 chars:

`| awk '{print substr($0, 1, 500)}`

## Get first letter

```bash
echo -e "This\nis\nmultiline string" | head -n 1 | cut -c1-1
```

## Tabs to spaces and back

`expand`, `unexpand`

Example:

`find -name \*.lua -exec bash -c 'unexpand --first-only --tabs=2 "$0" | tee "$0"' {} \;`

