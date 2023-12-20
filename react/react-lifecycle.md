# React: component lifecycle

**Mounting**: `constructor()`, `getDerivedStateFromProps()`, `render()`, `componentDidMount()`

**Updating**: `getDerivedStateFromProps()`, `shouldComponentUpdate()`, `render()`, `getSnapshotBeforeUpdate()`, `componentDidUpdate()`

**Unmounting**: `componentWillUnmount()`

**Error Handling**: `getDerivedStateFromError()`, `componentDidCatch()`

Только для компонентов. Для функциональных элементов используются hooks (`useState`, `useEffect`)

![react-lifecycle](https://raw.githubusercontent.com/d9k/d9k-textbook-assets/main/react/react-lifecycle/react-flow.jpg)

- [React Lifecycle: Methods & Hooks In Detail | Blog - BairesDev](https://www.bairesdev.com/blog/react-lifecycle-methods-hooks/)
- [Жизненный цикл компонента в React | OTUS](https://otus.ru/nest/post/2116/)