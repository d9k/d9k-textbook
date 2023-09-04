# JS: styling

## Change style

```
element.style.fontSize = "30px";
element.className = "custom-title";
element.classList.add("selected-title");
element.classList.remove("selected-title");
```

https://developer.mozilla.org/en-US/docs/Web/API/DOMTokenList

## Detect a mobile browser

```
user agent + screen resolution + touch  event  + media queries
```

```js
const isMobileBrowser = () => {

	// User agent string method
	let isMobile = /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i.test(navigator.userAgent);

	// Screen resolution method
	if (!isMobile) {
	    let screenWidth = window.screen.width;
	    let screenHeight = window.screen.height;
	    isMobile = (screenWidth < 768 || screenHeight < 768);
	}

	// Touch events method
	if (!isMobile) {
	    isMobile = (('ontouchstart' in window) || (navigator.maxTouchPoints > 0) || (navigator.msMaxTouchPoints > 0));
	}

	// CSS media queries method
	if (!isMobile) {
	    let bodyElement = document.getElementsByTagName('body')[0];
	    isMobile = window.getComputedStyle(bodyElement).getPropertyValue('content').indexOf('mobile') !== -1;
	}

	return isMobile
}
```

https://stackoverflow.com/a/76055222/1760643