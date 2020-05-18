@echo off
mode con cols=80 lines=25
title "Virus Vaccine v1.1"
color 0A
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v VirusVaccine /f
if "%ERRORLEVEL%"=="0" goto disautorun1
if _%1 == _vskip goto viremovl
cls
echo Утилита для удаления некоторых вирусов, распространяющихся с флэшками
echo и их разрушительного воздействия на систему
echo Копирайты: 
echo -----------------------------------------------------------------
echo * Оригинальный код неизвестного китайца           2007-05-23
echo * Модифицирован www.CTPAX-X.ru                    2007-09-08
color 01
echo * Модифицирован Andy -- http://minilabmaster.com  2007-10-14
color 0A
echo Удаляет следующие вирусы: C:\windows\
echo cmd.exe.exe,lsass.exe,setuprs1.pif
echo autorun.inf,autorun.exe, runauto...
echo Удаление вредоносного файла AutoRun.inf со всех дисков
echo ------------------------------------------------------------------
echo Добавлено Andy:
echo.
echo Восстанавливает доступ к реестру
echo Восстанавливает доступ к диспетчеру задач
echo Восстанавливает меню Вид-Свойства папки
echo Восстанавливает отображение скрытых файлов и папок
echo Восстанавливает запуск исполняемых файлов
echo Блокирует меню "Автозапуск" при наличии файла AutoRun.INF на диске
echo Не удаляет AutoRun.INF на флэшках от программы VirUpdate  
echo -------------------------------------------------------------------
set /p confremv="Начать? (нажмите Y для продолжения, R для создания точки восcтановления) "
if _%confremv% == _Y goto viremovl
if _%confremv% == _y goto viremovl
if _%confremv% == _Н goto viremovl
if _%confremv% == _н goto viremovl
if _%confremv% == _R goto restore
if _%confremv% == _r goto restore
if _%confremv% == _К goto restore
if _%confremv% == _к goto restore

goto quit
:restore
"%systemroot%\system32\restore\rstrui.exe
pause
goto viremovl
:viremovl
if not exist "%SYSTEMROOT%\subinacl.exe" copy subinacl.exe %SYSTEMROOT%\ 
echo Убиваем подозрительные процессы...
taskkill /fi "services eq kkdc" /f >nul
taskkill /im cmd.exe.exe /f >nul
taskkill /im regedit.exe.exe /f >nul
taskkill /im r.exe /f >nul
taskkill /im autorun.exe /f >nul
sc stop kkdc >nul
net stop kkdc >nul
sc delete kkdc >nul
echo Удаляем атрибуты "скрытый" и "системный" с 
echo подозрительных файлов... 
attrib -s -h -r %SystemDrive%\autorun.inf >nul
attrib -s -h -r %SystemDrive%\r.exe >nul
attrib -s -h -r %SystemDrive%\autorun.exe >nul
attrib -s -h -r "%SYSTEMROOT%\cmd.exe.exe" >nul
attrib -s -h -r "%SYSTEMROOT%\lsass.exe" >nul
attrib -s -h -r "%SYSTEMROOT%\setuprs1.pif" >nul
attrib -s -h -r "%SYSTEMROOT%\autorun.exe" >nul
attrib -s -h -r "%SYSTEMROOT%\r.exe" >nul
attrib -s -h -r "%SYSTEMROOT%\r*.exe" >nul
rd %SystemDrive%\runaut~1 /s /q >nul
echo Удаляем подозрительные файлы...
del %SystemDrive%\autorun.inf /q >nul
del %SystemDrive%\r.exe /q >nul
del %SystemDrive%\autorun.exe /q >nul
del "%SYSTEMROOT%\cmd.exe.exe" /q >nul
del "%SYSTEMROOT%\lsass.exe" /q >nul
del "%SYSTEMROOT%\autorun.exe" /q >nul
del "%SYSTEMROOT%\setuprs1.pif" /q >nul
del "%SYSTEMROOT%\r.exe" /q >nul
echo Переименовываем файл regedit.exe в _regedit.exe ...
ren "%SYSTEMROOT%\regedit.exe" _regedit.exe >nul
echo Удаляем подозрительные файлы по маске r*.exe...
del "%SYSTEMROOT%\r*.exe" /q >nul
echo Переименовываем файл regedit.exe обратно...
ren "%SYSTEMROOT%\_regedit.exe" regedit.exe >nul
echo Удаляем вредные ключи в реестре Windows, измененные вирусами...
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cmd.exe" /v Debugger /f >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\explorer.exe" /v Debugger /f >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\msconfig.exe" /v Debugger /f >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\regedit.exe" /v Debugger /f >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\regedt32.exe" /v Debugger /f >nul
reg delete "HKLM\SYSTEM\ControlSet001\Enum\Root\LEGACY_KKDC" /f >nul
reg delete "HKLM\SYSTEM\ControlSet002\Enum\Root\LEGACY_KKDC" /f >nul
reg delete "HKLM\SYSTEM\ControlSet003\Enum\Root\LEGACY_KKDC" /f >nul
reg delete "HKLM\SYSTEM\CurrentControlSet\Enum\Root\LEGACY_KKDC" /f >nul
reg delete "HKLM\SYSTEM\ControlSet001\Services\kkdc" /f >nul
reg delete "HKLM\SYSTEM\ControlSet002\Services\kkdc" /f >nul
reg delete "HKLM\SYSTEM\ControlSet003\Services\kkdc" /f >nul
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\kkdc" /f >nul
reg delete "HKLM\SYSTEM\ControlSet001\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List" /v %SYSTEMROOT%\lsass.exe /f >nul
reg delete "HKLM\SYSTEM\ControlSet002\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List" /v %SYSTEMROOT%S\lsass.exe /f >nul
reg delete "HKLM\SYSTEM\ControlSet003\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List" /v %SYSTEMROOT%\lsass.exe /f >nul
reg delete "HKLM\SYSTEM\CurrentControlSet\Services\SharedAccess\Parameters\FirewallPolicy\StandardProfile\AuthorizedApplications\List" /v %SYSTEMROOT%\lsass.exe /f >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v CheckedValue /f >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /v SVOHOST /f >nul
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v CheckedValue /f >nul
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL" /v CheckedValue /t reg_dword /d 1 /f >nul

rem Восстанавливаем доступ к реестру
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableRegistryTools /t reg_dword /d 0 /f
rem Восстанавливаем доступ к диспетчеру задач
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v DisableTaskMgr /t reg_dword /d 0 /f
rem Восстанавливаем меню Вид-Свойства папки
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v NoFolderOptions /f
rem Восстанавливаем отображение скрытых файлов и папок
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v Hidden /t reg_dword /d 0 /f
rem Восстанавливаем запуск исполняемых файлов
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v Userinit /t reg_sz /d %SYSTEMROOT%\system32\userinit.exe, /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Classes\exefile\shell\open\command" /ve /t reg_sz /d "\"%%1\" %%*%" /f
echo.
cls
echo Удаление известных вирусов и их последствий завершено...
echo.
echo Блокировать меню "Автозапуск" при наличии файла AutoRun.INF на диске?     
set /p confremv="Настоятельно рекомедуется! Нажмите Y если да, N если нет" 
if _%confremv% == _Y goto disautorun
if _%confremv% == _y goto disautorun
if _%confremv% == _Н goto disautorun
if _%confremv% == _н goto disautorun
goto delautorun 
:disautorun
echo.
echo Отключаем выполнение файла AutoRun.INF с Флэшек...
echo.
xcopy VirusVaccine.cmd %systemdrive%\ /y
xcopy subinacl.exe %systemdrive%\ /y
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run" /v VirusVaccine /t reg_sz /d %systemdrive%\VirusVaccine.cmd /f

subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /grant=SYSTEM=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /grant=Администраторы=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /grant=administrators=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /grant=ОГРАНИЧЕННЫЕ=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /grant=%USERNAME%=F >nul
reg delete "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /f >nul
rem reg delete "HKEY_LOCAL_MACHINE\SYSTEM\MountedDevices" /va /f
cls
echo Сейчас компьютер будет перезагружен
echo Если Вы хотите перезагрузить систему вручную
echo Просто закройте это окно, иначе - 
pause
shutdown -r -t 10 -c "Компьютер перезагружается программой Virus Vaccine "
exit

:disautorun1
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /grant=administrators=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /grant=Администраторы=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /deny=SYSTEM=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /deny=Администраторы=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /deny=administrators=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /deny=ОГРАНИЧЕННЫЕ=F >nul
subinacl /keyreg "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\MountPoints2" /deny=%USERNAME%=F >nul
cls
echo.
echo Отключение выполнения файла AutoRun.INF с Флэшек завершено!
:delautorun
echo.
echo Удаляем файл AutoRun.INF со всех дисков
echo Программа НЕ УДАЛЯЕТ AutoRun.INF от программы VirUpdate! 
echo.
echo Если файл не надо удалять с внешнего носителя,
echo вынете флэшку из компьютера... 
pause
setlocal ENABLEDELAYEDEXPANSION
for /D %%d in (c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z ) do (
@echo Проверяется диск: %%d
 DIR %%d:\ >nul
	if not ErrorLevel 1 (  
set asd=
if exist %%d:\autorun.inf (
	for /f "tokens=1" %%A in (%%d:\autorun.inf) do (
		if "%%A"=="Shell\RunSC\command=VirUpdate.cmd" (set asd=%%A)
		@echo %%A 
)
echo.
if "!asd!"=="Shell\RunSC\command=VirUpdate.cmd" @echo Этот AutoRun от VirUpdate!
echo.
)
	if not "!asd!"=="Shell\RunSC\command=VirUpdate.cmd" (
	if exist %%d:\autorun.inf cacls %%d:\autorun.inf /c /e /p /t everyone:f >nul
	if exist %%d:\autorun.inf attrib -s -h -r %%d:\autorun.inf >nul
	if exist %%d:\autorun.inf del %%d:\autorun.inf /q >nul
	if exist %%d:\autorun.inf rd %%d:\autorun.inf /s /q >nul
	if exist %%d:\runaut~1 cacls %%d:\runaut~1 /c /e /p /t everyone:f >nul
	if exist %%d:\runaut~1 rd %%d:\runaut~1 /s /q >nul
	if exist %%d:\autorun.inf.tmp attrib -s -h -r %%d:\autorun.inf.tmp >nul
	if exist %%d:\autorun.inf.tmp del %%d:\autorun.inf.tmp /q) >nul 
)
)
echo.
cls
echo Выполнено...
echo.
rem cls
if exist "%SYSTEMROOT%\cmd.exe.exe" goto vcmd
goto vmore
:vcmd
start "VRM" /I "%0" vskip
goto quit
:vmore
echo -----------------------------------------------------------------
echo Известные вирусы удалены, вредные модифицированные ключи
echo реестра удалены или восстановлены.
echo Для вступления в силу некоторых параметров требуется перезагрузка
echo Enjoy!
echo Удачи, заходите на мой сайт http://minilabmaster.com 
Echo Andy   
echo ------------------------------------------------------------------
DEL %systemdrive%\subinacl.exe /Q /F
pause
DEL %systemdrive%\VirusVaccine.cmd /Q /F
exit
:quit
cls
echo -----------------------------------------------------
Echo Вы выбрали ВЫХОД, защита не включена!  
Echo Удачи, заходите на мой сайт http://minilabmaster.com 
Echo Andy   
echo -----------------------------------------------------
echo.
DEL %systemdrive%\subinacl.exe /Q /F
pause
DEL %systemdrive%\VirusVaccine.cmd /Q /F
exit
