# TS config

## Show resulting config

`tsc --showConfig -p tsconfig.json`

## Genereting .d.ts types from .js jsdoc commetnts

https://www.typescriptlang.org/docs/handbook/declaration-files/dts-from-js.html

```
npx -p typescript tsc src/**/*.js --declaration --allowJs --emitDeclarationOnly --outDir types
```

