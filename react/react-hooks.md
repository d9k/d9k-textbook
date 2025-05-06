# React Hooks

## useRef vs useState

> Conceptually, you can think of refs as similar to instance variables in a class

Основное отличие, что useRef не вызывает перерисовку вотличие от useState

https://en.reactjs.org/docs/hooks-faq.html#is-there-something-like-instance-variables

## useMemo - почему не использовать везде?

+ `useMemoOne`

https://frontend-stuff.com/blog/understanding-when-use-usememo/

https://reactjs.org/docs/hooks-reference.html#usememo

Write your code so that it still works without useMemo — and then add it to optimize performance.

Если ты хочешь сохранить стабильную ссылку на объект / массив, не требующий пересчета, рассмотри возможность использования `useRef`.

https://kentcdodds.com/blog/usememo-and-usecallback

I would like to re-iterate that I strongly advise against using `React.memo` (or it's friends `PureComponent` and `shouldComponentUpdate`) without measuring because those optimizations come with a cost and you need to make sure you know what that cost will be as well as the associated benefit so you can determine whether it will actually be helpful (and not harmful) in your case, and as we observe above it can be tricky to get right all the time so you may not be reaping any benefits at all anyway.

On top of that React also stores previous values given the inputs and will return the previous value given the same previous inputs. That's memoization at work.

https://blog.logrocket.com/rethinking-hooks-memoization/

Если нам нужно просто сохранить ссылку на не меняющийся массив, лучше использовать `useRef`, а не `useMemo`:

```
function Bla() {
  const { current: baz } = useRef([1, 2, 3])
  return <Foo baz={baz} />
}
```

(От себя: ~~если надо менять редко, тоже подходит, т. к. useRef можно менять с помощью `useEffect`.~~
Правка, не подходит, см. https://stackoverflow.com/questions/60476155/is-it-safe-to-use-ref-current-as-useeffects-dependency-when-ref-points-to-a-dom. Лучше тогда `useEffect` + `useState`,
НО: https://www.coletiv.com/blog/dangers-of-using-objects-in-useState-and-useEffect-ReactJS-hooks/ - заменять надо объект целиком)

Benchmarks:

https://www.measurethat.net/Benchmarks/Show/7561/2/react-memo-or-no-memo

https://tsh.io/blog/usememo-performance-in-react-test-and-examples/

## Ignore request from effect result

```
  useEffect(() => {
    let ignore = false;
    async function fetchProduct() {
      const response = await fetch('http://myapi/product/' + productId);
      const json = await response.json();
      if (!ignore) setProduct(json);
    }

    fetchProduct();
    return () => { ignore = true };
  }, [productId]);
```

from https://reactjs.org/docs/hooks-faq.html#is-it-safe-to-omit-functions-from-the-list-of-dependencies

## slow useState initializer

use callback:

`const [rows, setRows] = useState(() => createRows(props.count));`

## useLayoutEffect разница с UseEffect

`useEffect` will run _after_ the render is committed to the screen (and seen by user).

`useLayoutEffect` will run after React computed DOM mutations but _before_ they are passed to browser and render is committed to the screen.

`useLayoutEffect` runs _synchronously_, not for heavy computations.

https://blog.logrocket.com/useeffect-vs-uselayouteffect/

## Можно, чтобы callback менял значение, от которого не зависит, но на основе предыдущего

с помощью callback:

`updateValue(previousValue => previousValue + 1);`

## useContext + useReducer = redux на минималках

https://habr.com/ru/post/473070/

## useEffect + useRef fail, what's instead?

```js
function MeasureExample() {
  const [height, setHeight] = useState(0);

  const measuredRef = useCallback(node => {
    if (node !== null) {
      setHeight(node.getBoundingClientRect().height);
    }
  }, []);

  return (
    <>
      <h1 ref={measuredRef}>Hello, world</h1>
      <h2>The above header is {Math.round(height)}px tall</h2>
    </>
  );
}
```

## merge useRef

- https://dev.to/thekashey/merging-refs-41l8
- https://mayursinhsarvaiya.medium.com/how-to-merge-refs-in-react-component-d5e4623b6924

## State colocation

- :newspaper: [React Reconciliation: скрытый механизм, управляющий компонентами | Хабр](https://habr.com/ru/companies/timeweb/articles/901212/)

Паттерн, который заключается в том, чтобы располагать состояние как можно ближе к месту его использования.

Например, `useState` перенести в новый вложенный компонент-обёртку, если есть частый сценарий, где только компоненты, использующие этот state и находящиеся рядом, должны перерисовываться.

