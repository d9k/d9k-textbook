# TDD: scope

## Test types by scope

- :newspaper: [First Steps in Frontend Testing with TDD/BDD | by Ariel Herman | Medium](https://medium.com/@aeh.herman/first-steps-in-frontend-testing-with-tdd-bdd-7ddab8796ad6)

- ***Unit tests*** validate the functionality of isolated code. They test the output of a “unit,” a pure function that always gives the same result for a given input. The bulk of the tests written for an application will be unit tests and these tests should be written in isolation from dependencies (network, database, or other code). As we will see, unit tests and functional programming make a good match.

- ***Integration tests*** verify the flow of data and the interaction of components. Once you want to examine the combined behavior of two or more units together, it is an integration test.

- ***End-to-End (E2E) tests*** look at the behavior of the overall application. Very few of these should be written for the application because if unit tests and integration tests are passing you shouldn’t need much E2E testing. They’re also expensive and time-consuming.


