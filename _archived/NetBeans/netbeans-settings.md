# Настройки NetBeans

## Изменение языка интерфейса

${NetBeans_Folder}/etc/netbeans.conf:
В `netbeans_default_options` добавить «-J-Duser.language=en -J-Duser.region=US»

http://tigor.com.ua/blog/2011/08/10/set-netbeans-user-interface-language/

## Перенос строк

Сервис->Параметры->Редактор->Форматирование->Перенос строки->Везде.


## Высота строки

В `~/.netbeans/x.x/config/Editors/Preferences/org-netbeans-modules-editor-settings-CustomPreferences.xml`:

	. . . . .
		<entry javaType="java.lang.Float" name="line-height-correction" xml:space="preserve">
			<value><![CDATA[1.4]]></value>
		</entry>
	</editor-preferences>

http://stackoverflow.com/questions/7581101/how-to-increase-line-height-in-netbeans-7

## Директория для перемещения проектов по-умолчанию

В файле`~/.netbeans/[NB_VERSION]/config/Preferences/org/netbeans/modules/projectui.properties`

	lastOpenProjectDir=путь/к/желаемой/папке

## Неплохой шрифт

monofur
