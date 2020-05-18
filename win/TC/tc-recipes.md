Рецерты TC
==========

Открытие папки в TC
-------------------

REGEDIT4

    [HKEY_CLASSES_ROOT\Folder\shell\tc]
    @="Открыть в Total Commander"

    [HKEY_CLASSES_ROOT\Folder\shell\tc\command]
    @="E:\\TOTALCMD\\TOTALCMD.exe /O /T /S /L=\"%1\""

    [HKEY_CLASSES_ROOT\Folder\shell\tc_new]
    @="Открыть в новом Total Commander"
    "Extended"=""

    [HKEY_CLASSES_ROOT\Folder\shell\tc_new\command]
    @="E:\\TOTALCMD\\TOTALCMD.exe /N /T /S /L=\"%1\""

