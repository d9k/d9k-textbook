# JS: parallel execution

## Service worker

* Rich offline experiences (offline first web application development)
* Periodic background syncs
* Push notifications
* Intercept and handle network requests
* Programmatically managing a cache of responses.

The problem with service worker is that it gets terminated when not in use, and restarted when it's next needed.
## How do you manipulate DOM using a service worker

Service worker can communicate with the pages it controls by responding to messages sent via the `postMessage` interface, and those pages can manipulate the DOM.
## How do you reuse information across service worker restarts

Service workers will have access to IndexedDB API in order to persist and reuse across restarts.

## Service worker in background

All modern browsers restrict background usage.

[javascript - Run a persistent web worker in the background without getting throttled - Stack Overflow](https://stackoverflow.com/questions/66822611/run-a-persistent-web-worker-in-the-background-without-getting-throttled)

## Web service workers use cases

* On mobile phones, and especially on low-end mobile phones, it is important to keep the main thread as idle as possible so it can respond to user interactions quickly and provide a jank-free experience. **The UI thread ought to be for UI work only**.
* Compressing/De-compressing files in the background
* I have used them for sending larger amounts of data from the browser to server. Obviously, you can do this with regular AJAX calls, but if
	* 1) this takes up one of the precious connections per hostname
	* 2) if the user does a page transition during this process (e.g clicks a link), your JavaScript objects from the previous page go away and you can't process callbacks. When a web worker is used, this activity happens out of band, so you have a better guarantee that it will complete.

- [javascript - What are the use-cases for Web Workers? - Stack Overflow](https://stackoverflow.com/questions/2773682/what-are-the-use-cases-for-web-workers)
- [John Resig - Computing with JavaScript Web Workers](https://web.archive.org/web/20150324224131/http://ejohn.org/blog/web-workers/)

## Debugging shared workers

chrome://inspect/#workers

## Service Worker

Service workers essentially act as proxy servers that sit between web applications, the browser, and the network. They are intended to enable the creation of effective offline experiences, intercept network requests and take appropriate action based on whether the network is available, and update assets residing on the server.

https://developer.mozilla.org/en-US/docs/Web/API/Service_Worker_API