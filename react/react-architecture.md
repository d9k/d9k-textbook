# Архитектура React

## JSX

Babel компилирует JSX в вызовы `React.createElement()`.


```
(
  <h1 className="greeting">
    Привет, мир!
  </h1>
)
```

->

```
React.createElement(
  'h1',
  {className: 'greeting'},
  'Привет, мир!'
);
```

## memo

https://react.dev/reference/react/memo

Оказывается, компоненты, не обёрнутые в `memo()`, будут перерисовываться, не сравнивая props при изм. родительского компонента.