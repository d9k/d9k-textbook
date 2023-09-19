# JS async

- Also obligatory see async js jupyter notebook [^j]
## async & await

Remember, the await keyword is only valid inside async functions.

https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/await
https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Statements/async_function
## Why do we need callbacks

Javascript is an event driven language. That means instead of waiting for a response javascript will keep executing while listening for other events. Let's take an example with the first function invoking an API call(simulated by setTimeout) and the next function which logs the message.

## Event-driven programming

(Javascript is an event driven language.)

See the answer in [js language](./js-language.md) article.
## What are the three states of promise

Promises have 3 states:

1. **Pending:** This is an initial state of the Promise before an operation begins
2. **Fulfilled:** This state indicates that the specified operation was completed.
3. **Rejected:** This state indicates that the operation did not complete. In this case an error value will be thrown.

## Async function

An ***async function*** is a function declared with the async keyword which enables
asynchronous, promise-based behavior to be written avoiding promise chains. Async function can contain zero or more await expressions. Errors thrown inside promises and rejected promises can be handled within `try/catch` blocks in async fuction body.

## Links

[^j]: [async js jupiter notebook](https://github.com/d9k/d9k-jupyter/blob/main/js-async.ipynb)
