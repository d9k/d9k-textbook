# TypeScript declare

## Стандартные члены модуля пропадают при переопределении

Перед

```
declare module 'some/module/name' {
  export interface MyCustomInterface {
```

нужно добавить

`import 'some/module/name`

в начало `.d.ts`-файла, тогда объявление не перезапишется, а смержится

### +

Либо export declare
либо
...
export default '@mui/...'
