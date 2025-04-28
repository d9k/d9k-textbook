# React: error handling

## `<ErrorBoundary>` / `componentDidCatch`

Если ошибки не перехватывать, в случае ошибки произойдёт `unmount` ("я нажала и всё куда-то исчезла")

- :beginner: [Catching rendering errors with an error boundary | Component – React](https://react.dev/reference/react/Component#catching-rendering-errors-with-an-error-boundary)
	- `<ErrorBoundary>` implementation example

- :speech_balloon: [reactjs - React hooks equivalent of componentDidCatch? | SO](https://stackoverflow.com/questions/59932119/react-hooks-equivalent-of-componentdidcatch)

- :newspaper: [Error Handling with Error Boundary Hooks | GeeksforGeeks](https://www.geeksforgeeks.org/error-handling-with-error-boundary-hooks/)
	- [react-error-boundary](https://github.com/bvaughn/react-error-boundary) by [bvaughn](https://github.com/bvaughn)
		- _Simple reusable React error boundary component_

```tsx
<ErrorBoundary
	FallbackComponent={ErrorFallback}>
	<ComponentwithError />
</ErrorBoundary>
```