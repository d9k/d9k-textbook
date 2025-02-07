# TDD: F.I.R.S.T. principle

- :newspaper: [Applying Test-Driven Development. Red, green, and so on | by Rayhan Arwindra | Pilar 2020 | Medium](https://medium.com/pilar-2020/applying-test-driven-development-6d6d3af186cb)

From the book Clean Code by Bob Martin¹, we have the ***F.I.R.S.T principle*** for testing:

- ***Fast***: Your tests should be fast enough that it doesn’t deter you or other programmers to initialize the testing procedure.

- ***Independent***: Each test should be independent, it should not depend on tests that have happened previously. If the tests require data, then that data has to be set up at the very beginning of that test, not the one before.

- ***Repeatable***: Tests should be able to run in any environment, whether it is at your local machine, other people’s machines, or at the git repository. If the tests fail, it is because the functionality of the program is not correct, nothing else.

- ***Self-Validating***: The tests should tell you whether or not it succeeds. It should not require the developers to manually check the output of the test in order to dictate whether or not the test is successful. We can do this by returning a boolean, or by using the assert method available in most programming languages or test frameworks.

- ***Timely***: Tests should be written just before the programmer writes the code to make it pass, not after. This is especially true if we are following TDD (which we are!)
