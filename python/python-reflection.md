Отражения в Python
==================

Проверка типа
-------------

    if isinstance(item, str):
        print(item)

Проверка None
-------------

    hurt = None
    if hurt is None:
        print('Hooray!')

Посылка аргументов из dict в функцию 
------------------------------------

    d = dict(p1=1, p2=2)
    def f2(p1,p2):
        print p1, p2
    f2(**d)

https://docs.python.org/2/tutorial/controlflow.html#unpacking-argument-lists
http://stackoverflow.com/questions/334655/passing-a-dictionary-to-a-function-in-python-as-keyword-parameters

Повторный import изменившегося модуля
-------------------------------------

###Загружено как `import module_name`

python 2:

    reload(module)

python 3:

    imp.reload(config_structure_parser)

python 3.4+:

     importlib.reload(module) # (?)

http://stackoverflow.com/questions/437589/how-do-i-unload-reload-a-python-module

###Загружено как `from module_name import *`

Если не нужно ф.-й с других модулей

    globals().clear()
    # и from.. import.. заново

Если нужно
    
    def reimport(module_name, *names):

        if module_name in sys.modules:
            importlib.reload(sys.modules[module_name])
        else:
            __import__(module_name, fromlist=names)

        for name in names:
            globals()[name] = getattr(sys.modules[module_name], name)

REPL в запущенный процесс
-------------------------

http://eventlet.net/doc/modules/backdoor.html

Смотреть низкоуровневый код функции
-----------------------------------

    >>> import dis
    >>> def foo():
    ...     global bar
    ...     baz = 5
    ...     print bar
    ...     print baz
    ...     print quux
    ... 
    >>> dis.disassemble(foo.func_code)
      3           0 LOAD_CONST               1 (5)
                  3 STORE_FAST               0 (baz)

      4           6 LOAD_GLOBAL              0 (bar)
    . . . . .
    
http://stackoverflow.com/a/6664227


Array accessor
--------------

    class MetaContainer():
        def __delitem__(self, key):
            self.__delattr__(key)
        def __getitem__(self, key):
            return self.__getattribute__(key)
        def __setitem__(self, key, value):
            self.__setattr__(key, value)

http://stackoverflow.com/a/6486401
