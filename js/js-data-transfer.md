# JS: data transfer

## SSE

**Server-sent events (SSE)** is a server push
technology enabling a browser to receive automatic updates from a server via HTTP connection without resorting to polling. These are a one way communications channel - events flow from server to client only. Events are limited to UTF-8 (no binary data). This has been used in Facebook/Twitter updates, stock price updates, news feeds etc.

Back: GET-request send headers:
```
'Content-Type': 'text/event-stream',
'Connection': 'keep-alive
```

Front:

```js
const eventSource = new EventSource(url);
eventSource.onmessage = (event) => {
	const parsedData = JSON.parse(event.data);
};
/** onopen, onerror handlers... */
```

SSE is faster than websockets.

- [How To Use Server-Sent Events in Node.js to Build a Realtime App | DigitalOcean](https://www.digitalocean.com/community/tutorials/nodejs-server-sent-events-build-realtime-app?utm_source=pocket_reader)

- [html - WebSockets vs. Server-Sent events/EventSource | SO](https://stackoverflow.com/questions/5195452/websockets-vs-server-sent-events-eventsource/75010024#75010024)
- SSE is generally simpler to implement and easier to test/debug (a simple curl could be used).

### Fetch Event Source: libraries

- [fetch-event-source](https://github.com/Azure/fetch-event-source)
	- A better API for making Event Source requests, with all the features of fetch()

- ## WebSocket

- Bidirectional

### WebSocket: libraries

- [socketio/socket.io: Realtime application framework (Node.JS server)](https://github.com/socketio/socket.io)
	- Auto-reconnection, disconnection detection, multiplexing with namespaces support, channel (Room) support