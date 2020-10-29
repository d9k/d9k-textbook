Настройки phpstorm
==================

## linux fonts drawing fix

sudo apt-get install fonts-inconsolata
sudo apt-get install ttf-inconsolata

https://github.com/DeLaGuardo/Inconsolata-LGC

Following the PhpStorm issue, here is what I added to phpstorm64.vmoptions (that I have installed in /usr/local/bin/PhpStorm/bin/):

-Dswing.aatext=true
-Dawt.useSystemAAFontSettings=gasp
-Dsun.java2d.xrender=true

http://stackoverflow.com/questions/6151426/phpstorm-editor-fonts-on-linux-systems

## Отключение автосохранения

	Appearance & Behavior -> System settings ->
		[v] confirm application exit
		[ ] save files on frame deactivation
		[ ] use save write

## File associations

`Editor -> File Types`

## Debug log limit

`bin/idea.properties`:
`idea.cycle.buffer.size=1024`

https://intellij-support.jetbrains.com/hc/en-us/community/posts/206164609-Configure-Number-of-Lines-In-Debug-Output



## XDebug: "Debugger extension is not detected" error

`Interpreter: <Default project interpreter>` fixed bug for me
