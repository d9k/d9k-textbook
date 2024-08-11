# HTML: shadow DOM

https://plainvanillaweb.com/pages/components.html

In general shadow DOM should be avoided if possible, because it impacts accessibility, SEO and performance, and it suffers from a FOUC (flash of instyled component)  while the stylesheet from the `<link>` tag is loading.

Intermediate elements need to be created between the root element and the contained children, like the `<header>` in the example above. Only the use of a slot inside of a shadow DOM makes this possible.
Multiple places in the web component will accept children. Named slots provide this ability. This can be convenient for layout components.
The styles should be maximally isolated from the containing page. This is often the case for web components designed to be embedded in third party sites.