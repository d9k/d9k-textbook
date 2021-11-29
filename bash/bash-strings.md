# Bash: strings

## Truncate/limit lines

to 500 chars:

`| awk '{print substr($0, 1, 500)}`
