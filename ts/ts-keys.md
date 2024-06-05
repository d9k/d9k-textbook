# TS keys

## example:

`type Optional<T> = { [P in keyof T]? :T[P] }`

## in Enum:

`[P in T]`

## Optional and required keys:

`{[cellType in CT]?: string} | {['default']: string}`

## Fn argument as enum key

`function printStatus(code: keyof typeof HttpStatus) {`

https://stackoverflow.com/a/61218597/1760643
