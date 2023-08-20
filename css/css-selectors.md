# CSS: селекторы

## Типы селекторов

Universal, Element type, ID, Class, Descendant, Child (`>`), General sibling (`~`), Adjacent sibling (`+`), Attribute (`[type=submit]`)

## Селекторы атрибутов

```
/* with a title attribute */
a[title] { }

/* with an href "https://example.org" */
a[href="https://example.org"] {}

/* with an href containing "example" */
a[href*="example"] {}

/* with an href ending ".org", case-insensitive */
a[href$=".org" i] {}

/* with word "logo" in class attribute (sep. by whitespeace) */
a[class~="logo"] {}

/* Will match "zh" or "zh-*" (example: zh-Hans-CN, zh-Hant-TW). */
div[lang|="zh"] { }
```

[Attribute selectors - CSS: Cascading Style Sheets | MDN](https://developer.mozilla.org/en-US/docs/Web/CSS/Attribute_selectors)