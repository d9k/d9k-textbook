# JS: storage

## Difference of localStorage and Indexed DB

_localStorage_, or more accurately Web Storage, was designed for smaller amounts of data. It's essentially a _strings only key - value storage_, with a simplistic _synchronous_ API.

_IndexedDB_, on the other hand, was designed to work with significantly larger amounts of data and has asynchronous API. Additionally, indexedDB, as the name reveals, provides indexes and transactions,

Session storage - like local storage but until tab is closed.
## Max. storage capacity

IndexedDB: lower value of "2 GiB" and "10% of mass storage total capacity"
localStorage/sessionStorage: 5 mb
cookie: 4 kb

## Cookie API

`document.cookie`: asymmetrical API:
setter - set **one** cookie
getter - get **all** visible cookies separated by `; `.

https://developer.mozilla.org/en-US/docs/web/api/document/cookie

## Cookie options

### expires

```
document.cookie = "username=John; expires=Sat, 8 Jun 2019 12:00:00 UTC";
```

by default is deleted when the browser is closed.

### path

`document.cookie = "username=John; path=/services";`

current page by default

## Cookie delete

Set passed date, remember the path:
```js
document.cookie =
  "username=; expires=Fri, 07 Jun 2019 00:00:00 UTC; path=/;";
```