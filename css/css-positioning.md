# CSS: позиционирование

## По центру горизонтально

http://www.w3.org/Style/Examples/007/center

```
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

```
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

```
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
