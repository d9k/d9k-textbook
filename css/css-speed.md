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