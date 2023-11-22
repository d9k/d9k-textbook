# CSS-in-JS

- [CSS Evolution: From CSS, SASS, BEM, CSS Modules to Styled Components | by Carl0zen | Medium](https://medium.com/@perezpriego7/css-evolution-from-css-sass-bem-css-modules-to-styled-components-d4c1da3a659b) ([WayBack mirror](https://web.archive.org/web/20191209120825/https://medium.com/@perezpriego7/css-evolution-from-css-sass-bem-css-modules-to-styled-components-d4c1da3a659b))
- [Thorough Analysis of CSS-in-JS | CSS-Tricks](https://css-tricks.com/a-thorough-analysis-of-css-in-js/)

## And what about BEM?

- Class names selection became a tedious task
- Markup became bloated with all those long class names
- You needed to explicitly extend every ui component whenever you wanted to reuse
- Relying on the developer to choose unique class names

## Predecessor: CSS Modules

- https://css-tricks.com/css-modules-part-1-need/
- https://github.com/css-modules/css-modules

CSS modules: create a dynamic class names for each locally defined style.

- No more conflicts.
- Explicit dependencies.
- No global scope by default

```css
.title { background-color: red; }
```

```jsx
import styles from "./styles.css";

element.innerHTML =
  `<h1 class="${styles.title}">
     An example heading
   </h1>`;
```

### Composition

```css
.newClassName {
  composes: sameModuleClassName;
  composes: otherModuleClassName from "./styleHelpers.css";
}
```

### :global

https://github.com/css-modules/css-modules/issues/264#issuecomment-609067219

When I want my classes to not be hashed, so that I can use them in regular css `className` instead of the `styles.className` syntax, but I still needed to declare them in css-modules way using `.global(.className)`, so that I can still use them with css modules to compose local classes from those global classes.

`:global .className` or `.className :global` would mean that any classnames or declarations you refer inside this block would be used from global declarations.

Useful cases: animations, targeting a regular global class from within a local class.

### Disdvantages

- Requirement to create separate style file

## JSS

- **JSS** is a tool that lets you use **JavaScript** to describe styles in CSS in a declarative and reusable way.

- [React-JSS](https://cssinjs.org/react-jss)
- [Server-Side rendering](https://cssinjs.org/react-jss#server-side-rendering)

- Alternatives:
	- [Styled-JSS](https://cssinjs.org/styled-jss) - styled-components like API.
	- [Glamor-JSS](https://github.com/dan-lee/glamor-jss/) - glamor flavored CSS with JSS under the hood.
	- [Aphrodite-JSS](https://github.com/cssinjs/aphrodite-jss/) - aphrodite like API.

## CSS-in-JS / Валерий Сорокобатько, 2017

https://youtu.be/gfU17b8TFYU?si=BAUUeN9FmVjOjyOM

- Удобство шаринга - не нужно настраивать import css
- Более мощный css - вся мощь js, npm-модули [polished]
- Константы css хранятся на стороне js (например, полезно, если нужно производить действие по завершении анимации)
- проще настраивать webpack, vite, тестовое окружение

Inline-стили лучше не использовать, т. к. нет поддержки псевдоклассов (:hover...) и приходится генерировать много

JSS: один из первых объектов, - медленный, + названия полей, в которые вложены стили будут началом сгенерир. классов, задание объектом

FELA: if the view is a function of state, your style should be too. Style = function(props). Atomic CSS-design: для каждого css-правила генерируется повторно используемый класс, + быстрее. Задание объектом. ACD неудобно отлаживать, но есть плагин monolith для dev-окружения.

GLAM: str. literal, исп. CSS-переменные. - Нужна настройка webpack

Styled Components - только для React. Оч. медленные. Внутри содержит обрезанный PostCSS

tuchk4/rockey - заброшенная библиотека от автора доклада

## CSS-in-JS Disadvantages

- [CSS Modules vs CSS-in-JS. Who wins? | DEV.to](https://dev.to/alexsergey/css-modules-vs-css-in-js-who-wins-3n25)
- [Why We're Breaking Up with CSS-in-JS - dev.to](https://dev.to/srmagura/why-were-breaking-up-wiht-css-in-js-4g9b)

- The browser won't start interpreting the styles until styled-components has parsed them and added them to the DOM, which slows down rendering.
- The absence of CSS files means that you cannot cache separate CSS.
- CSS-in-JS increases your bundle size.
- CSS-in-JS clutters the React DevTools
- In concurrent rendering, React can yield to the browser between renders. If you insert a new rule in a component, then React yields, the browser then have to see if those rules would apply to the existing tree. So it recalculates the style rules.
	- This quote from Sebastian is specifically referring to performance in React Concurrent Mode, **without** `useInsertionEffect`. I recommend reading the full discussion if you want an in-depth understanding of this.
	- https://github.com/reactwg/react-18/discussions/110
- Conflicting multiple CSS-in-JS instances if use frameworks
	- [You are loading @emotion/react when it is already loaded · Issue #2639 emotion-js/emotion](https://github.com/emotion-js/emotion/issues/2639)
		- [fix](https://github.com/emotion-js/emotion/issues/2639#issuecomment-1105881066)

- on React 18 server-side rendering problems:
	- [Stitches developer about static extract](https://github.com/stitchesjs/stitches/discussions/1149#discussioncomment-6223090)

## Compile time CSS-in-JS drawbacks

- [Why We're Breaking Up with CSS-in-JS - dev.to](https://dev.to/srmagura/why-were-breaking-up-wiht-css-in-js-4g9b)

- https://compiledcssinjs.com/#speed-up-your-styles
	- Styles are still inserted when a component mounts for the first time, which forces the browser to recalculate the styles on every DOM node.
	- Boilerplate components cluttering React DevTools
	- Dynamic styles becomes CSS variabled in inline style props

## CSS-in-JS comparison

- [andreipfeiffer/css-in-js](https://github.com/andreipfeiffer/css-in-js), 2022
- [Styling: CSS-in-JS | Next.js](https://nextjs.org/docs/app/building-your-application/styling/css-in-js)