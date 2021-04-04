# TS keys

## example:

`type Optional<T> = { [P in keyof T]? :T[P] }`

## in Enum:

`[P in T]`

## Optional and required keys:

`{[cellType in CT]?: string} | {['default']: string}`
