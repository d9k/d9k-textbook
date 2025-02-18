# Programming: reactivity

## React is MVVM?

- [Model-View-ViewModel — Википедия](https://ru.wikipedia.org/wiki/Model-View-ViewModel)

- ViewModel - обёртка данных из Модели, подлежащиx связыванию + команды, которыми может пользоваться Представление, чтобы влиять на Модель.
- Contoller не подразумевает связывания данных. А ViewModel подразумевает.

## Is React reactive?

- :speech_balloon: [reactjs - reactive programming in react | SO](https://stackoverflow.com/questions/71855096/reactive-programming-in-react)

React/Vue is MVVM - it means that it's only responsibility is to keep your View-Model (an application layer that is responsible for data user sees) in sync with View (the document).

The main difference of Reactive Programming implementations and MVVM's is the scope of usage:
- Reactivity ends outside of the View layer
- Reactive Programming allows you to have an application-wide reactive graph

When people say that "N is a reactive framework", they usually have ***MVVM reactivity*** in mind, not Reactive Programming.

## How React isn't reactive, and why you shouldn't care - DEV Community

- :newspaper: https://dev.to/this-is-learning/how-react-isn-t-reactive-and-why-you-shouldn-t-care-152m

### 1. Reactive Streams

Its most famous incarnation in JavaScript is RxJS and powers things like Angular.

 RxJS cool example:

```js
const listener = merge(
  fromEvent(document, 'mousedown').pipe(mapTo(false)),
  fromEvent(document, 'mousemove').pipe(mapTo(true))
)
  .pipe(sample(fromEvent(document, 'mouseup')))
  .subscribe(isDragging => {
    console.log('Were you dragging?', isDragging);
  });
```

- :beginner: [sample | RxJS](https://rxjs.dev/api/index/function/sample)
	- Emits the most recently emitted value from the source Observable whenever another Observable, the notifier, emits.

## RxJS

- :speech_balloon: [Can someone please explain rxJs with examples. : r/angular](https://www.reddit.com/r/angular/comments/130zn1k/can_someone_please_explain_rxjs_with_examples/)

Match score needs to be updated in the screen periodically without refreshing the page and the page refresh should automatically stop when the match completes. When using RxJS it minimizes writing complex logic.

- [When To Use RxJS | RxJS - Javascript library for functional reactive programming.](https://xgrommx.github.io/rx-book/content/guidelines/when/index.html)

Code that deals with more than one event or asynchronous computation gets complicated quickly as it needs to build a state-machine to deal with ordering issues.

Next to this, the code needs to deal with successful and failure termination of each separate computation. This leads to code that doesn’t follow normal control-flow, is hard to understand and hard to maintain.

UI paradigm of receiving completion suggestions while the user is typing input:

```js
var dictionarySuggest = Rx.Observable.fromEvent(input, 'keyup')
  .map(() => input.value)
  .filter(text => !!text)
  .distinctUntilChanged()
  .throttle(250)
  .flatMapLatest(searchWikipedia)
  .subscribe(
    results => {
      results.map(createItem);
    },
    err => logError(err)
  );
```

### Recipes | Learn RxJS

- :beginner: https://www.learnrxjs.io/learn-rxjs/recipes

### RxJS: see also

- Marble diagrams
	- :beginner: [RxMarbles: Interactive diagrams of Rx Observables](https://rxmarbles.com/)
	- :newspaper: [Understanding Marble Diagrams for Reactive Streams | by James Shvarts | Medium](https://medium.com/@jshvarts/read-marble-diagrams-like-a-pro-3d72934d3ef5)