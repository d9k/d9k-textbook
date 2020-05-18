# Рецепты ZeroBrane Studio

## Отладка

Небходимо вывод `luarocks path` (`export LUA_PATH=...`) скопировать в стартовый скрипт shell (вроде `~/.zshrc`) и из shell'а запускать zerobrane studio (`zbstudio`).

## Highlight currentx with lexer

`ide:GetEditor():SetupKeywords('lua')` in console
