# Трюки с CSS

## Расширить div картинкой

Расширить div картинкой с ``float: right;`` или align = right

 способ 1) Добавить в конце div'а <div style="clear:both;"></div>
 способ 2) Добавить для контейнера style="overflow:hidden;"

## Чтобы широкая картинка втискивалась в div

Чтобы широкая картинка не резалась div'ом, а втискивалась в него

 способ 1) Вложить в `<p></p>`
 способ 2) У контейнера ``overflow: hidden``, у изображения ``align:left; max-width: 100%``

http://alistapart.com/article/fluid-images
http://clagnut.com/sandbox/imagetest/

## Горизонтальный список

```css
#navcontainer ul
{
	margin: 0;
	padding: 0;
	list-style-type: none;
	text-align: center;
}

#navcontainer ul li { display: inline; }

#navcontainer ul li a
{
	text-decoration: none;
	padding: .2em 1em;
	color: #fff;
	background-color: #036;
}

#navcontainer ul li a:hover
{
	color: #fff;
	background-color: #369;
}
```

HTML code:

```html
<div id="navcontainer">
	<ul>
		<li><a href="#">Milk</a></li>
		<li><a href="#">Eggs</a></li>
		<li><a href="#">Cheese</a></li>
		<li><a href="#">Vegetables</a></li>
		<li><a href="#">Fruit</a></li>
	</ul>
</div>
```

http://css.maxdesign.com.au/listutorial/horizontal_master.htm


## Скрыть у numeric field кнопки

```css
input[type='number'] {
	-moz-appearance:textfield;
}

input::-webkit-outer-spin-button,
input::-webkit-inner-spin-button {
	-webkit-appearance: none;
	margin: 0;
}
```

http://stackoverflow.com/questions/3790935/can-i-hide-the-html5-number-input-s-spin-box