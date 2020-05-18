Openresty
=========

## Установка

https://www.8host.com/blog/ustanovka-openresty-na-nginx-v-ubuntu-16-04/

## luarocks для luajit

https://github.com/torch/luajit-rocks
или https://github.com/GitBubble/luajit-rocks (на данный момент здесь есть поддержка luajit 2.1 beta 3)

в параметр `-DCMAKE_INSTALL_PREFIX` передать папку, где luajit (старый забекапить) (`/usr/local/openresty/luajit`).


`/usr/local/openresty/luajit/share/lua/5.1/luarocks/site_config.lua` (забекапить!)

добавить строки

```
site_config.LUAROCKS_EXTERNAL_DEPS_SUBDIRS={ bin="bin", lib={ "lib", [[lib/x86_64-linux-gnu]] }, include="include" }
site_config.LUAROCKS_RUNTIME_EXTERNAL_DEPS_SUBDIRS={ bin="bin", lib={ "lib", [[lib/x86_64-linux-gnu]] }, include="include" }
```

, чтобы пакеты с зависимостями от `.so` библиотек ставились без проблем (см. https://github.com/daurnimator/lua-http/issues/39#issuecomment-248057342).

Потом в `/usr/local/openresty/luajit/share/lua/5.1/luarocks/cfg.lua` и в `/usr/local/openresty/luajit/etc/luarocks/config.lua` (забекапить!) поменять `.luarocks` на `.luarocks-jit`.

## Отладка

http://notebook.kulchenko.com/zerobrane/debugging-openresty-nginx-lua-scripts-with-zerobrane-studio

see also https://github.com/pkulchenko/MobDebug

