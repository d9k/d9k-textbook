# CSS: позиционирование

## Чем `position: fixed` отличается от `position: absolute` в CSS?

`position: absolute` - элемент позиционируется относительно ближайшего родителя с position не static (например, relative).

`position: static` - элемент позиционируется относительно окна браузера. При прокрутке страницы элемент остаётся на одном месте экрана.

## float и clear

`float` - floated element остаётся частью flow web-страницы в отличие от absolute-элементов. Flow - обтекание текстом и `inline`-элементами.

`float: left | right`

`clear: left | right | both` - отключение обтекания предыдущего float-элемента (размещение под ним)

## По центру горизонтально

http://www.w3.org/Style/Examples/007/center

```css
p { text-align: center }
h2 { text-align: center }

p.blocktext {
    margin-left: auto;
    margin-right: auto;
    width: 6em
}

img.displayed {
    display: block;
    margin-left: auto;
    margin-right: auto
}

div.displayed {
    margin-left: auto;
    margin-right: auto
}
```

## По центру вертикально

```css
div.container {
    min-height: 10em;
    display: table-cell;
    vertical-align: middle;
}
```

## Выравнивание input

### По label
http://www.cyberforum.ru/html/thread826851.html

## Div - как вертикально-центральное окно для большего изображения

```css
.img-wrapper{
    position: relative;
    overflow:hidden;
    height:425px;
}

.img-wrapper img{
    position: absolute;
    top:-100%; left:0; right: 0; bottom:-100%;
    margin: auto;
}
```

https://stackoverflow.com/a/20142384/1760643
