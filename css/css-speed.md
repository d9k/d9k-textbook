# CSS: оптимизация загрузки/производительности

## Critical CSS

- [Критический CSS + прогрессивный CSS = ? — Веб-стандарты](https://web-standards.ru/articles/critical-and-progressive-css/)

Критический CSS — это стили, которые необходимы для отрисовки первой видимой части страницы.

- [critical](https://github.com/addyosmani/critical) by [addyosmani](https://github.com/addyosmani)
	- _Extract & Inline Critical-path CSS in HTML pages_
- [rollup-plugin-critical](https://github.com/nystudio107/rollup-plugin-critical) by [nystudio107](https://github.com/nystudio107)
	- _Vite.js & Rollup plugin for generating critical CSS_
- [nuxt-beastcss](https://github.com/bnznamco/nuxt-beastcss) by [bnznamco](https://github.com/bnznamco)
	- _Fast Critical CSS for Nuxt_

При использовании <`script`> с атрибутами async и defer, мы можем попросить браузер загружать скрипт асинхронно, без блокировки рендеринга страницы, но у `<link>` таких атрибутов нет. Из этой ситуации нас спасёт [loadCSS](https://github.com/filamentgroup/loadCSS) — её использование позволит вашей странице отрисоваться с критическим CSS и не ждать полной загрузки остальных стилей.

## Progressive CSS

Прогрессивный CSS предполагает создание отдельного CSS-файла для каждой части страницы: перед каждой вставляется `<link rel="stylesheet">` со стилем только этой части.

Благодаря тому, что `<link rel="stylesheet">` блокирует рендеринг до окончания загрузки стилей, страница будет загружаться последовательно по частям.

## Layout Thrashing

- :newspaper: [Avoid large, complex layouts and layout thrashing | web.dev](https://web.dev/articles/avoid-large-complex-layouts-and-layout-thrashing)

Избегать Layout Thrashing - отделять чтение данных геометрии от его изменения (разбивать один цикл на два отдельных цикла)

```js
// Плохо: 100 чтений offsetWidth → 100 перерасчетов макета
for (let i = 0; i < 100; i++) {
  const width = elements[i].offsetWidth;
  elements[i].style.width = width + 10 + 'px';
}

// Хорошо: 1 чтение всех значений → 1 перерасчет
const widths = elements.map(el => el.offsetWidth);
for (let i = 0; i < 100; i++) {
  elements[i].style.width = widths[i] + 10 + 'px';
}
```

```js
// Плохо: при каждом скролле читаем offsetTop
window.addEventListener('scroll', () => {
  const elementTop = element.offsetTop;
  // ...
});

// Хорошо: кешируем значение заранее
const elementTop = element.offsetTop;
window.addEventListener('scroll', () => {
  // Используем elementTop без повторного чтения
});
```

Когда кеширование бесполезно или вредно?
- Если значение может измениться между чтением и использованием:
- Если свойство читается один раз (нет циклов или частых вызовов).
- Для реактивных фреймворков (React, Vue, Angular): Вместо ручного кеширования используйте оптимизации фреймворка (например, `useMemo` в React, `computed` во Vue).
	- Избегайте чтения геометрических свойств в рендеринге — делайте это в `useEffect` или `mounted`.

- :stethoscope: Layers DevTools panel
	- :newspaper: [Eliminate content repaints with the new Layers panel in Chrome | LogRocket Blog](https://blog.logrocket.com/eliminate-content-repaints-with-the-new-layers-panel-in-chrome-e2c306d4d752?gi=cd6271834cea)

## What is the difference between reflow and repaint

- _Repaint_ occurs when changes are made which affect the visibility of an element, but not its layout. Examples of this include
	- outline
	- visibility
	- background color

- _Reflow_ involves changes that affect the layout of the whole page or a portion of the page. Reflow can be triggered by
	- resizing the browser window
	- changing the font
	- content changing (such as user typing text)
	- using JavaScript methods involving computed styles
	- adding or removing elements from the DOM
	- changing an element's classes

Reflow of an element causes the subsequent reflow of all child and ancestor elements as well as any elements following it in the DOM.
