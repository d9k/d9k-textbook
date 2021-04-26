# JS: promises

## Await all in parallel

```
const a = async () => 'a'
const b = async () => 'b'
const c = async () => 'c'
await Promise.join(a(), b(), c()) === ['a', 'b', 'c']
```
