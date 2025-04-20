# React: JSX

## What is JSX

- :beginner: [JSX In Depth – React](https://legacy.reactjs.org/docs/jsx-in-depth.html)

`JSX` code compiles to `React.createElement` calls:


```jsx
<MyButton color="blue" shadowSize={2}>
  Click Me
</MyButton>
```

compiles to

```js
React.createElement(
  MyButton,
  {color: 'blue', shadowSize: 2},
  'Click Me'
)
```

## Repeat n times

```jsx
{ Array.from(
	{ length: 10 },
	(_, i) => <span key={i}>Your text</span>)
}
```

Explanation: https://stackoverflow.com/a/68029192/1760643
