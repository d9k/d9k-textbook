## JS: order

## What is an event loop

Event loop is a process that continuously monitors both the call stack and the event queue and checks whether or not the call stack is empty.

If the call stack is empty and there are pending events in the event queue, the event loop dequeues the event from the event queue and pushes it to the call stack. The call stack executes the event, and any additional events generated during the execution are added to the end of the event queue.

https://github.com/sudheerj/javascript-interview-questions#what-is-an-event-loop

## What is an event queue

The event/callback/macrotask queue stores async callbacks to be later added to the call stack.

Once the call stack is empty and there is a callback in the event queue, the event loop moves the callback into the call stack.

Whenever the call stack receives an async function, it is moved into the \[parallel thread running by\] Web API \[/ libuv\]. Based on the function, Web API executes it and awaits the result. Once it is finished, it moves the callback into the event queue (the callback of the promise is moved into another queue: the microtask queue).

\[Microtask queue have greater priotity then macrotask queue\].

https://github.com/sudheerj/javascript-interview-questions#what-is-an-event-queue