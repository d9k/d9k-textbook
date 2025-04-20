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

