# Mantine v. 7

- [Version v7.0.0](https://mantine.dev/changelog/7-0-0/)
- [6.x -> 7.x migration guide](https://mantine.dev/guides/6x-to-7x/)

## Components

- [AppShell](https://mantine.dev/core/app-shell/)
	- responsive shell for your application with header, navbar, aside and footer
- [Drawer](https://mantine.dev/core/drawer)
	- [Initial focus](https://mantine.dev/core/drawer/#initial-focus)
- [Fieldset](https://mantine.dev/core/fieldset/)
- [Group](https://mantine.dev/core/group/)
	- compose elements and components in a horizontal flex container (`Stack` for vertical)
- [Input.Placeholder](https://mantine.dev/core/input/#inputplaceholder-component)
	- add placeholder to Input and InputBase components that are based on button element or do not support placeholder property natively:
		```jsx
		<Input component="button" pointer>
		  <Input.Placeholder>Placeholder content</Input.Placeholder>
		</Input>
		```
	- test
- [Input.Wrapper](https://mantine.dev/core/input/#inputwrapper-component)
	- used in all other inputs (`TextInput`, `NativeSelect`, `Textarea`, etc.) under the hood, you do not need to wrap your inputs with it, as it is already included in all of them. Use `Input.Wrapper` only when you want to create custom inputs.
- [LoadingOverlay](https://mantine.dev/core/loading-overlay)
- [ScrollArea](https://mantine.dev/core/scroll-area/#scroll-element-into-view)
- [Stack](https://mantine.dev/core/stack/)
	- compose elements and components in a vertical flex container (`Group` for horizontal)
- [Tabs](https://mantine.dev/core/tabs/)
	- can be used as horizontal menu
		- [Usage with react-router | Tabs](https://mantine.dev/core/tabs/#usage-with-react-router)
- [TagsInput](https://mantine.dev/core/tags-input/)
- [TypographyStylesProvider](https://mantine.dev/core/typography-styles-provider)
- [VisuallyHidden](https://mantine.dev/core/visually-hidden/)
	- hide element visually but keep it accessible for screen readers

## Configuration

### defaultRadius

- [defaultRadius | Theme object](https://mantine.dev/theming/theme-object/#defaultradius)

```jsx
<MantineProvider theme={{ defaultRadius: 'sm' }}>
```

### Polymorphic components

- [Polymorphic components](https://mantine.dev/guides/polymorphic/)
- [Text as polymorphic component](https://mantine.dev/core/text/#polymorphic-component)

- Sizes: [Button changes](https://mantine.dev/changelog/7-0-0/#button-changes)
	- `compact` prop was removed, use `size="compact-XXX"` instead: [Compact size | Button](https://mantine.dev/core/button/#compact-size)

### Default props

- [Default props | Input](https://mantine.dev/core/input/#default-props-on-theme)
- [Default props | Theming](https://mantine.dev/theming/default-props/#useprops-hook)

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

## Advanced styling

### Accessing theme values

#### Inside the components

[use-mantine-theme hook | Theme object](https://mantine.dev/theming/theme-object/#use-mantine-theme-hook)

```tsx
import { useMantineTheme } from '@mantine/core';

const theme = useMantineTheme();
<div style={{ background: theme.colors.blue[5] }} />;
```

#### Outside of components

[Access theme outside of components | Theme object](https://mantine.dev/theming/theme-object/#access-theme-outside-of-components)

```js
import { createTheme, mergeMantineTheme, DEFAULT_THEME } from '@mantine/theme';

const themeOverride = createTheme({
  primaryColor: 'orange',
  defaultRadius: 0,
});

export const theme = mergeMantineTheme(DEFAULT_THEME, themeOverride);
```

### User-defined theme values

- [other | Theme object](https://mantine.dev/theming/theme-object/#other)

```jsx
<MantineProvider
  theme={{ other: {
    charcoal: '#333333',
    primaryHeadingSize: 45,
    fontWeights: { bold: 700,	extraBold: 900 }
  } }}
>
```

### Styling component parts: `classNames`

- [classNames prop | Styles API | Mantine docs](https://mantine.dev/styles/styles-api/#classnames-prop)

With the `classNames` prop you can add classes to inner elements of Mantine components. It accepts an object with element names as keys and classes as values:

```tsx
import classes from './Demo.module.css';

<TextInput
  classNaOrgModemes={{
	root: classes.root, input: classes.input, label: classes.label,
  }}
```

### Static classes

- [Static classes | Global styles](https://v7.mantine.dev/styles/global-styles#static-classes)

`@mantine/core` package includes the following static classes:

- `mantine-active` – contains `:active` styles
- `mantine-focus-auto` – contains `:focus-visible` styles
- `mantine-focus-always` – contains `:focus` styles
- `mantine-focus-never` – removes default browser focus ring

### Focus ring

- [focus ring | Theme object](https://mantine.dev/theming/theme-object/#focusring): Controls focus ring styles: `auto | always | never`. (`auto` - focus on keyboard <kbd>Tab</kdb> key / browser setting)
- [focus class name | Theme object](https://mantine.dev/theming/theme-object/#focusclassname)

https://mantine.dev/theming/theme-object/#focusclassname

## SSR

- [Color schemes | Mantine](https://mantine.dev/theming/color-schemes/#color-scheme-value-caveats)
	- By default, the color scheme value is stored in local storage, and its value is saved in state before the component is mounted to avoid flash of inaccurate color scheme. This means that color scheme value can be different on client and server, as server does not have access to local storage and always uses the default value.