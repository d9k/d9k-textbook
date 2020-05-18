# Операции с файловой системой Lua

## Текущий путь

```
local lfs = require 'lfs'
local currentdir = lfs.currentdir()
```

## Отделение расширения

```
> pl_path = require 'pl.path'
> filepath = [[/home/user/file.ext]]
> dirpath, file = pl_path.splitpath(filepath)
> dirpath, file
/home/user      file.ext
> filename, fileextwithdot = pl_path.splitext(file)
> filename, fileextwithdot
file    .ext
fileext = (fileextwithdot:sub(1,1) == '.') and fileextwithdot:sub(2) or fileextwithdot
```
