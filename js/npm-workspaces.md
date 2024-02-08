# NPM: workspaces

- [workspaces | npm Docs](https://docs.npmjs.com/cli/v7/using-npm/workspaces)

```bash
npm init -w ./packages/a
```

adding a dependency named `abbrev` from the registry as a dependency of your workspace **a**:

```bash
npm install abbrev -w a
```

## Running commands in the context of workspaces

`npm run test --workspace=a`

- this will run the `test` script defined within the `./packages/a/package.json` file.

```
npm run test --workspaces --if-present
```

Will run the test script in all workspaces with implemented `test` script.


