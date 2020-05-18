Рецепты Firefox
===============

в Firefox направление ввода текста в адресной строке меняется по ctrl+shift+X

alt+Enter в адресной строке - открыть введённые слова для поиска или адрес сайта в новой вкладке

копировать русскоязычные символы из строки адреса без %hh.
	network.standard-url.escape-utf8 = false

Пользовательский css
--------------------

1) `Firefox --> Help --> Troubleshooting Information --> Open Containing Folder`
2) mkdir chrome; cd chrome
3) touch userContent.css
4) to newly created file:

	@-moz-document domain(your_domain.com) {
		img {
			opacity: 0.05 !important;
		}

    }

see https://superuser.com/a/603224/31155 for black color of about:blank

http://superuser.com/questions/318912/how-to-override-the-css-of-a-site-in-firefox-with-usercontent-css

Скриншот web-страницы
---------------------

`shift+f2`

screenshot screen.png --fullpage
