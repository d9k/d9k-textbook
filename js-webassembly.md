# JS: WebAssembly

- :tv: [Server-Side WebAssembly / Ramón Huidobro | YT](https://www.youtube.com/watch?v=JjPKfcmjKtk)

## Whai is WASI

- [WebAssembly System Interface (WASI) | Node.js Documentation](https://nodejs.org/api/wasi.html)
 - [WASI GitHub](https://github.com/WebAssembly/WASI)

WebAssembly System Interface is a set of APIs which give sandboxed WebAssembly applications access to the underlying operating system via a collection of POSIX-like functions.

>_"If WASM+WASI existed in 2008, we wouldn't have needed to created Docker. That's how important it is. Webassembly on the server is the future of computing. A standardized system interface was the missing link. Let's hope WASI is up to the task!"_
>/ [Solomon Hykes, 2019](https://twitter.com/solomonstre/status/1111004913222324225) developer of [Docker](https://en.wikipedia.org/wiki/Docker_(software))

^d9k-WASI-quote-2023-11-08

— like containers didn't fully replace VMs.

> _"“So will wasm replace Docker?” No, but imagine a future where Docker runs linux containers, windows containers and wasm containers side by side. Over time wasm might become the most popular container type. Docker will love them all equally, and run it all :)"_
> / [Solomon Hykes, 2019](https://twitter.com/solomonstre/status/1111113329647325185?lang=en)

## WASI APIs

- [WebAssembly/wasi-nn: Neural Network proposal](https://github.com/WebAssembly/wasi-nn)
## Benchmark

- Wasm overhead is somewhere in the range of 14% (1.14x slower) to 50% (1.5x slower)

- https://news.ycombinator.com/item?id=32084768, 2022
