# JS: DOM

## Определение

 - [Что такое Объектная Модель Документа (DOM) | Введение - Интерфейсы веб API | MDN](https://developer.mozilla.org/ru/docs/Web/API/Document_Object_Model/Introduction#что_такое_объектная_модель_документа_dom)

Объектная модель документа DOM (Document Object Model) - структуры дерева, представляющей элементы страницы. DOM полностью поддерживает объектно-ориентированное представление веб-страницы, делая возможным её изменение при помощи языка описания сценариев наподобие JS.

## Добавление элемента

```
var btn = document.createElement("button");
myDiv.appendChild(btn);
```

http://www.w3schools.com/jsref/met_document_createelement.asp

## Известен ли тэг

```
function isElementSupported(tag){
  var element = document.createElement(tag);
  return Object.prototype.toString.call(element) !== '[object HTMLUnknownElement]' ;
}
```
