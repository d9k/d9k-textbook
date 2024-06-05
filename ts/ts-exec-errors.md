# TypeScript: common execution errors

## ts-node: cannot find module

```
npm install --save-dev tsconfig-paths
```

`tsconfig.json`:

```json
{
  "ts-node": {
    "require": ["tsconfig-paths/register"]
  }
}
```

- :speech_balloon: [node.js - Typescript path aliases not resolved correctly at runtime | SO](https://stackoverflow.com/questions/60067281/typescript-path-aliases-not-resolved-correctly-at-runtime/73935402#73935402)
