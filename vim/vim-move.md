# Vim: motion

## Scroll - How to move screen without moving cursor in Vim? | SO

- https://stackoverflow.com/questions/3458689/how-to-move-screen-without-moving-cursor-in-vim/60607857

```
+-------------------------------+
^                               |
|c-e (keep cursor)              |
|H(igh)             zt (top)    |
|                   ^           |
|           ze      |      zs   |
|M(iddle)  zh/zH <--zz--> zl/zL |
|                   |           |
|                   v           |
|L(ow)              zb (bottom) |
|c-y (keep cursor)              |
v                               |
+-------------------------------+
```
