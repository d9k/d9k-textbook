# TDD: coding

## Test Driven Development for Frontend Developers | by Catherine Angel | Medium

- https://medium.com/@catherineangelr/test-driven-development-for-frontend-developers-e2e518098938


## 5 Tips for Writing Great Javascript Unit Tests | by Yahel Yechieli | Medium

- :newspaper: https://medium.com/@yahelyechieli/5-tips-for-writing-great-javascript-unit-tests-86296ad2d997

### Names

The description must describe the intended action and the expected result: `should [expected behavior] when [scenario/context]`.

### One Concern in One Test

Put one `expect()` in each `it()`. Reveal exactly why a given scenario fails — no other issues are complicating the cause-and-effect.

```ts
describe('isUndefined function', ()=> {
        it('should return true when object is undefined', () => {
           expect(isUndefined(undefined)).toEqual(true);
        });

        it('should return false when object has a boolean value', () => {
           expect(isUndefined(true)).toEqual(false);
        });
});
```

 When you find yourself writing logic into a test, divide it into smaller tests of only one concern each.

### Test behavior only.

Don't test internal implementation which will change. Test behavior only.

### One Initialization

Don't repeat initialization. Use `beforeEach()` hook.

## mawrkus/js-unit-testing-guide: 📙 A guide to unit testing in Javascript

- https://github.com/mawrkus/js-unit-testing-guide
	- _📙 A guide to unit testing in Javascript_

### [Structure your tests properly](https://github.com/mawrkus/js-unit-testing-guide?tab=readme-ov-file#-structure-your-tests-properly)

Don't hesitate to nest your suites to structure logically your tests in subsets. (`describe()` can be nested)

## Why tests called `.spec.*`?

- :speech_balloon: [ruby on rails - What's the difference between tests and specs? | SO](https://stackoverflow.com/questions/16802030/whats-the-difference-between-tests-and-specs#:~:text=A%20spec%2C%20short%20for%20specification%2C%20comes%20from%20behavior,the%20interface%20%28instead%20of%20the%20implementation%29%20as%20well.)

:thinking_face: Возможно потому что тест со спецификацией того, что он тестирует, более новый стандарт, чем "классические" тесты:

см. [betterspecs](https://www.betterspecs.org/), [Clean Coder - Specs vs. Tests](https://sites.google.com/site/unclebobconsultingllc/specs-vs-tests)

> A spec, short for specification, comes from behavior driven testing, and encourages the mindset where you are defining 'what' the software does.
>
> Calling it a test leads to a much more general way of thinking about the code, and does not reinforce the idea that you should be testing the interface (instead of the implementation) as well.

/ [SciPhi](https://stackoverflow.com/users/765063/sciphi)