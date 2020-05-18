# Пути Lua

## Автозагрузка локальных модулей

`require 'luarocks.loader'`

## Исправление путей загрузки через локальное

Дописать в `~/.bashrc` строки из результата вывода команды `luarocks path`

Cм. http://www.thijsschreijer.nl/blog/?p=1025
Лучше даже писать не в `LUA_PATH`, а в `LUA_PATH_5_2`.

## Добавить путь скрипта в путь для поиска модулей

(чтобы можно было запускать из любой папки, а не только переходя в папку с проектом)

```
require 'luarocks.loader'

-- see https://stevedonovan.github.io/Penlight/api/libraries/pl.path.html
local pl_path = require 'pl.path'

script_path = debug.getinfo(1,'S').source
script_name = pl_path.basename (script_path)
if string.sub(script_path, 1, 1) == '@' then
    script_path = string.sub(script_path, 2)
end
script_path = pl_path.abspath(script_path)
script_dir = pl_path.dirname(script_path)
package.path = script_dir..'/?.lua;'..package.path
package.cpath = script_dir..'/сmodules/?.dll;'..script_dir..'./сmodules/?.so;'..package.cpath
```
