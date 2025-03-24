# Ripgrep

## Registered file types

`rg --type-list`

## Replace multiline pattern

- [text processing - Replace multiline string in files - Unix & Linux Stack Exchange](https://unix.stackexchange.com/questions/181180/replace-multiline-string-in-files/594201#594201)

```bash
RESULT=$(
	echo -e "$ALL_LINES_RAW" \
	| rg '^((-.*://.*\n)+)' \
	--replace "- ${DEFAULT_GROUP_NAME}\n\$1" \
	--multiline \
	--passthru \
	| sed -e 's|\\n|\n|g'
)
```