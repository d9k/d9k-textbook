# React: routing

Роутинг в React — это механизм навигации между различными компонентами приложения в зависимости от URL-адреса. Он позволяет создавать одностраничные приложения (SPA), где переходы между «страницами» происходят без перезагрузки,

## React Router 6

- :beginner: [createBrowserRouter | React Router](https://reactrouter.com/6.30.0/routers/create-browser-router)
- :speech_balloon: [javascript - How to template jsx with createBrowserRouter | SO](https://stackoverflow.com/questions/74168742/how-to-template-jsx-with-createbrowserrouter)
- :beginner: [Outlet | React Router](https://reactrouter.com/6.30.0/components/outlet)

```jsx
import {
  createBrowserRouter,
  RouterProvider,
} from 'react-router-dom';

const router = createBrowserRouter([
  {
    element: <HeaderLayout />,
    children: [
      {
        path: "/",
        element: <div>Hello</div>,
      },
      {
        path: '/foo',
        element: <div>foo</div>,
      },
      {
        path: '/bar',
        element: <div>foo</div>,
      }
    ],
  },
]);

// Обернуть приложение в
<RouterProvider router={router} />
```

```jsx
import { Outlet } from 'react-router-dom';

const HeaderLayout = () => (
  <>
    <header>
      <Navbar />
    </header>
    <Outlet />
  </>
);
```

- :beginner: [Server-Side Rendering | React Router](https://reactrouter.com/6.30.0/guides/ssr)

## Migration React Router 5 to 6

- docs pages
  - https://v5.reactrouter.com/web/api/
  - https://reactrouter.com/docs/en/v6/api
  - https://reactrouter.com/docs/en/v6/upgrading/v5
- Remove `<Redirect>`s inside `<Switch>`
- Upgrade all `<Switch>` elements to `<Routes>`
  - All `<Route>`s and `<Link>`s inside a `<Routes>` are relative.
- `<Route exact>` is gone. Instead, routes with descendant routes (defined in other components) use a trailing * in their path to indicate they match deeply
- `files-*` is not valid route path
-  If you were using the RegExp syntax to do URL param validation (e.g. to ensure an id is all numeric characters) please know that we plan to add some more advanced param validation in v6 at some point
- Either all routes in a `<Routes>` element are case-sensitive or they are not.
- Use `useRoutes()` instead of `react-router-config`
  - `In fact, <Routes> is really just a wrapper around useRoutes.`
- Use `useNavigate()` instead of `useHistory()`
  -  `navigate(to, { replace: true })` вместо `history.replace(to);`
  - alt: `<Navigate to="/home" replace state={state} />;`
- `<NavLink className={({ isActive }) => "nav-link" + (isActive ? " activated" : "")}`
- navigate(-1): back
- `<Link>` no longer supports the `component` prop
  - First of all, a `<Link>` should pretty much always render an `<a>`. If yours does not, there's a good chance your app has some serious accessibility and usability problems
- `<Prompt>` is not currently supported
  - https://github.com/remix-run/react-router/issues/8139
    - https://github.com/remix-run/react-router/issues/8139#issuecomment-977790637
      - As react-router expose NavigationContext under UNSAFE_NavigationContext we can add useBlocker hook back using the same code.
      - https://gist.github.com/rmorse/426ffcc579922a82749934826fa9f743