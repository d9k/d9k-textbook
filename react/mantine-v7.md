# Mantine: v. 7

- [Version v7.0.0](https://mantine.dev/changelog/7-0-0/)
- [6.x -> 7.x migration guide](https://mantine.dev/guides/6x-to-7x/)

## Components

- [AppShell](https://mantine.dev/core/app-shell/)
- [Fieldset](https://mantine.dev/core/fieldset/)
- [Group](https://mantine.dev/core/group/)
	- compose elements and components in a horizontal flex container
- [Input.Placeholder](https://mantine.dev/core/input/#inputplaceholder-component)
	- add placeholder to Input and InputBase components that are based on button element or do not support placeholder property natively:
		```jsx
		<Input component="button" pointer>
		  <Input.Placeholder>Placeholder content</Input.Placeholder>
		</Input>
		```
	- test

## Configuration

- [Polymorphic components](https://mantine.dev/guides/polymorphic/)
- Sizes: [Button changes](https://mantine.dev/changelog/7-0-0/#button-changes)
	- `compact` prop was removed, use `size="compact-XXX"` instead: [Compact size | Button](https://mantine.dev/core/button/#compact-size)
- [Default props](https://mantine.dev/core/input/#default-props-on-theme)
	```jsx
	const theme = createTheme({
	  components: {
	    Input: Input.extend({
	      defaultProps: {
	        variant: 'filled',
	      },
	    }),

	    InputWrapper: Input.Wrapper.extend({
	      defaultProps: {
	        inputWrapperOrder: ['label', 'input', 'description', 'error'],
	      },
	    }),
	  },
	});

	// . . . . .
	 <MantineProvider theme={theme}>
	```

## Responsive styles performance

- https://mantine.dev/styles/styles-performance/

Responsive [style props](https://mantine.dev/styles/style-props/) have worse performance than regular style props because they require injecting <style /> tag next to the component. It is fine to use responsive style props to apply styles to several components, but it is not recommended to use them in large lists of components, for example, if you have 1000 inputs with responsive margins, it is better to refactor to use classNames prop:

## Static classes

`@mantine/core` package includes the following static classes:

- `mantine-active` – contains :active styles
- `mantine-focus-auto` – contains :focus-visible styles
- `mantine-focus-always` – contains :focus styles
- `mantine-focus-never` – removes default browser focus ring