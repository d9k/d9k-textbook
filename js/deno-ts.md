# Deno + TypeScript

## Providing types

```ts
// @deno-types="./coolLib.d.ts"
import * as coolLib from "./coolLib.js";
```
### Using `deno.json` config

```json
{
  "compilerOptions": {
    "types": [
      "./types.d.ts",
      "https://deno.land/x/pkg@1.0.0/types.d.ts",
      "/Users/me/pkg/types.d.ts"
    ]
  }
}
```
- https://docs.deno.com/runtime/manual/advanced/typescript/types
