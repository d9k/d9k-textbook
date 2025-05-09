# Browser: rendering

## How browser rendering works?

This entire process is called the critical rendering path (CRP).

HTML: Bytes -> Characters -> Tokens -> Nodes -> DOM

CSS: CSS Bytes -> Characters -> Tokens -> Nodes -> CSSOM

DOM + CSSOM -> render tree -> reflow (layout)

Layout: calculation of the exact size and position of each object on the page

> Whenever the browser encounters a script tag, the DOM construction is paused! The entire DOM construction process is halted until the script finishes executing.

> So, even though the DOM construction stops until an encountered script tag is encountered, that’s not what happens with the CSSOM.

> With the CSSOM, the JS execution waits. No CSSOM, no JS execution.

https://blog.logrocket.com/how-browser-rendering-works-behind-scenes/
