# Text manipulation

## Tabs to spaces and back

`expand`, `unexpand`

Example:

`find -name \*.lua -exec bash -c 'unexpand --first-only --tabs=2 "$0" | tee "$0"' {} \;`
