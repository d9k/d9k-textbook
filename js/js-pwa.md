# PWA

__Progressive web application__ are a type of mobile app delivered through the web, built using common web technologies including HTML, CSS and JavaScript. T
## Advantages

(compared with traditional mobile apps)

- accessible through URLs
- indexed by search engines
- PWAs run on any phone and they cost a fraction of a native app that would do the same.
- don't need store and approval
- updates are instant
- development costs a fraction of a native app

- https://www.reddit.com/r/webdev/comments/wrsusd/are_pwas_being_sidelined/ikuekq5

Disadvantage

- No ability to do push notifications (yet)
- Cumbersome install process to the homescreen
- Limited local data storage ability. OS may purges this automatically after a few weeks if the app isn't used or on low space after semi-automatic cleanup.
- Limited integration with native device features: constant permission prompts, no NFC or bluetooth, no background operations

## What is an app shell model

Design pattern that keeps a web app's UI and data modules apart.
User interface is constant across views and pages. (?)
Cache the app shell with network request interceptors Service Workers.

* Reducing the time it takes for the program to load for the first time due to caching the app shell.
* Offline functionality

Examples: Google Maps, Twitter Lite, Uber.

TODO