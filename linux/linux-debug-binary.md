# Linux debug binary

## Отправка багрепортов о крэше

	ubuntu-bug <package_name>

See https://wiki.kubuntu.org/Kubuntu/Bugs/Reporting

## Stack-trace of python app crash

```
% gdb python
(gdb) run ./test.py
(gdb) bt
```

```
% strace python scintilla-example.py 2>&1 | grep open
```
