# Node.js: filesystem

## Слежение за файлами в папке (нерекурсивное)

```
fs.watch('./', {}, (eventType, filename) => console.log('fs.watch', eventType, filename)
```
