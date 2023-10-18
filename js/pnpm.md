# PNPM


- npx -> pnpm dlx
- cache directory: `pnpm store path
## npx

```sh
alias pnx='pnpm dlx'
pnx ladlescoop src/button.tsx
```

But better install globally first, then run

```sh
pnpm --global install ladlescoop
pnpm exec ladlescoop src/button.tsx
```

## yarn create

```sh
pnpm create
```