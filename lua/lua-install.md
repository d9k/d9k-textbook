Installation of Lua
===================

    sudo apt-get install lua5.2 lua5.2-dev

может называться liblua5.2-dev

## luaver

Рекомендуемый способ

https://github.com/DhavalKapil/luaver

    luaver install 5.3.0
    luaver install-luarocks 2.4.4

В `~/.bashrc` добавить:

    [ -s ~/.luaver/luaver ] && . ~/.luaver/luaver
    luaver use 5.2.4 > /dev/null
    luaver use-luarocks 2.4.4 > /dev/null

## luarocks

    tar -zxvf luarocks-xx.tar.gz
    cd luarocks-xx
    make build
    sudo make install

  либо:скачать нужную версию, затем

    ./configure --lua-version=5.2 --versioned-rocks-dir
    make build
    sudo make install

    (см. https://github.com/luarocks/luarocks/wiki/Installation-instructions-for-Unix про флаги configure)

потом можно ещё

    sudo su
    > luarocks install luarocks

## install rock with luarocks

	sudo luarocks install [rock_name]

## install lua repl

	sudo luarocks install luarepl

run:

	rlwrap lua.repl

## См. также

файл openresty.md рядом, раздел про luarocks.
