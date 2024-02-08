# NodeJS: turborepo

- [turbo](https://github.com/vercel/turbo) by [vercel](https://github.com/vercel)
	- _Incremental bundler and build system optimized for JavaScript and TypeScript, written in Rust – including Turbopack and Turborepo._

## Caching

- [Caching | Core concepts | Turborepo docs](https://turbo.build/repo/docs/core-concepts/caching)

Turborepo takes a lot of information into account when creating the hash: the dependency graph, tasks it depends on, source files, environment variables, and more!

[# Hashing](https://turbo.build/repo/docs/core-concepts/caching#hashing): to construct hash Turborepo uses the values of environment variables listed in [globalEnv | configuration (Turborepo docs)](https://turbo.build/repo/docs/reference/configuration#globalenv), The sorted list of environment variable key-value pairs specified in `pipeline.<task>.env` list.

Not only does `turbo` cache the output of your tasks, it also records the terminal output (i.e. combined `stdout` and `stderr`) to (`<package>/.turbo/run-<command>.log`). When `turbo` encounters a cached task, it will replay the output as if it happened again, but instantly, with the package name slightly dimmed. / [Logs | Caching | Turborepo docs](https://turbo.build/repo/docs/core-concepts/caching#logs)

```bash
turbo run build --force
```

— force overwrite cache, disable reading the cache

```bash
turbo run dev --no-cache
```

— read existing cache, don't write new cache

### See also

- [# Handling platforms and other arbitrary hash contributors](https://turbo.build/repo/docs/core-concepts/caching#handling-platforms-and-other-arbitrary-hash-contributors)

## Package Installation

[Package Installation – Turborepo](https://turbo.build/repo/docs/handbook/package-installation)

```bash
npm install <package> --workspace=<workspace>
```

## Pipeline

- [Create a pipeline | Add Turborepo to your existing monorepo | Getting Started with Turborepo | Turborepo docs](https://turbo.build/repo/docs/getting-started/existing-monorepo#create-a-pipeline)

To define your monorepo's task dependency graph, use the `pipeline` key in the `turbo.json` configuration file at the root of monorepo.

```json
{
  "$schema": "https://turbo.build/schema.json",
  "pipeline": {
    "build": {
      // A package's `build` script depends on that package's
      // dependencies and devDependencies
      // `build` tasks  being completed first
      // (the `^` symbol signifies `upstream`).
      "dependsOn": ["^build"],
      // note: output globs are relative to each package's `package.json`
      // (and not the monorepo root)
      "outputs": [".next/**", "!.next/cache/**"]
    },
    "deploy": {
      // A package's `deploy` script depends on the `build`,
      // `test`, and `lint` scripts of the same package
      // being completed. It also has no filesystem outputs.
      "dependsOn": ["build", "test", "lint"]
    },
    "test": {
      // A package's `test` script depends on that package's
      // own `build` script being completed first.
      "dependsOn": ["build"],
      // A package's `test` script should only be rerun when
      // either a `.tsx` or `.ts` file has changed in `src` or `test` folders.
      "inputs": ["src/**/*.tsx", "src/**/*.ts", "test/**/*.ts", "test/**/*.tsx"]
    },
    // A package's `lint` script has no dependencies and
    // can be run whenever. It also has no filesystem outputs.
    "lint": {},
    "dev": {
      "cache": false,
      "persistent": true
    }
  }
}
```

- Configuration:
	- [# dependsOn](https://turbo.build/repo/docs/reference/configuration#dependson) - + `^` (upstream) meaning
	- [# outputs](https://turbo.build/repo/docs/reference/configuration#outputs) - Omitting this key or passing an empty array can be used to tell turbo that a task is a side-effect and thus doesn't emit any filesystem artifacts (e.g. like a linter), but you still want to cache its logs

## Internal packages

- [Internal Packages | Turborepo docs](https://turbo.build/repo/docs/handbook/sharing-code/internal-packages)

Internal packages are packages which are only intended to be used inside your monorepo. They're extremely useful for sharing code between apps in closed-source monorepos.