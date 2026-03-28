# JS: datetime

## Why does JS getMonth() count from 0?

:speech_balloon: [date - why does javascript getMonth count from 0 and getDate count from 1? | SO](https://stackoverflow.com/questions/15799514/why-does-javascript-getmonth-count-from-0-and-getdate-count-from-1)

1) index of order array of months names

:speech_balloon: [datetime - Why does the month argument range from 0 to 11 in JavaScript's Date constructor? | SO](https://stackoverflow.com/questions/2552483/why-does-the-month-argument-range-from-0-to-11-in-javascripts-date-constructor/41992352#41992352)

2) The real answer to this question, is that it was copied from `java.util.Date`, which also had this quirk. Proof can be found on Twitter from Brendan Eich - the guy who originally implemented JavaScript «We were under "Make It Look Like Java" mgmt orders, and | had ten days to demo. No time to invent our own date API or even fix Java's».
