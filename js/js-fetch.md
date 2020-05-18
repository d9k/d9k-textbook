# JS fetch()

The fetch() method returns a promise which is fulfilled once the response is available.

The promise does not reject on HTTP errors — instead it only rejects on network errors; then handlers must check for HTTP errors.

`fetchResponsePromise = fetch(resource, init);`

https://developer.mozilla.org/en-US/docs/Web/API/WindowOrWorkerGlobalScope/fetch

## `init` settings

* `credentials` - To automatically send cookies for the current domain, this option must be provided.
  - https://developer.mozilla.org/en-US/docs/Web/API/Request/credentials
  - `omit`: Never send or receive cookies.
  - `same-origin`: Send user credentials (cookies, basic http auth, etc..) if the URL is on the same origin as the calling script. This is the default value.
  - `include`: Always send user credentials (cookies, basic http auth, etc..), even for cross-origin calls.
* `keepalive` - The keepalive option can be used to allow the request to outlive the page. Fetch with the keepalive flag is a replacement for the Navigator.sendBeacon() API.
* `signal`: An AbortSignal object instance; allows you to communicate with a fetch request and abort it if desired via an AbortController.

## Response

`Response implements Body, so it also has the following methods available to it:`

* Body.json()
  - Takes a Response stream and reads it to completion. It returns a promise that resolves with the result of parsing the body text as JSON.

https://developer.mozilla.org/en-US/docs/Web/API/Response
