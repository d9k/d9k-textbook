# JS: browser API

##

- [Javascript Cheat Sheet | OverAPI.com](https://overapi.com/javascript)

## Что в window

свойства: `console, document, history, localStorage, location (read-only), performance, scheduler, navigator, screen, sessionStorage, speechSynthesis`

свойства, сввязанные с iframe: `frames, length, name, opener, parent, top`

свойства про видимость элементов интерфейса браузера: `locationbar, menubar, peronalbar, statusbar, toolbar`

методы: `alert(), open() / close(), confirm(), focus() / blur(), {request,canc}AnimationFrame(), {request,cancel}IdleCallback(), {set,clear}Immediate, postMessage(), print(), prompt(), scrollBy(), scrollTo(), stop()`

события: `afterprint, beforeUnload, focus / blur, copy / cut / paste, devicemotion, deviceorientation, error, hashchange, load, message, online / offline, resize, storage, unhandledrejection`

## Что в window.navigator

свойства: `clipboard, cookieEnabled, geolocation, gpu (WebGPU), hardwareConcurrency, language, languages, mediaCapabilities, mediaDevices, onLine, platform, serviceWorker, userActivation, userAgent, webdriver`

методы: `getBattery(), {un,}registerProtocolHandler(), sendBeacon(), share() / canShare(), vibrate()`

## Что в window.document

свойства: `characterSet, cookie, doctype, documentURI. fonts, fullscreenElement, location, title, URL, visibilityState`

свойства про DOM: `body, children, documentElement (html), embeds, forms, head, images, links, pictureInPictureElement, readyState, referrer, scripts, styleSheets`

методы: `exitPictureInPicture(), scroll(), scrollBy()` \[TODO\]

методы про DOM: `adoptNode(), append(), createAttributeNS(), createElement(),  createRange(), createTreeWalker(), elementsFromPoint(), setAttribute()

события: `DOMContentLoaded, fullscreenchange, `

метод про DOM XPath: `createExpression(), evaluate() `

## Что в window.document.body

(какие-то из этих методов есть в люобом `HTMLElement`)

свойства: `text` \[TODO\]

методы: `{request,exit}Fullscreen()

методы про DOM: как и в `window.document`, `setHTML()`

`window.load`
