# TDD: frontend

## First Steps in Frontend Testing with TDD/BDD | by Ariel Herman | Medium

- https://medium.com/@aeh.herman/first-steps-in-frontend-testing-with-tdd-bdd-7ddab8796ad6

```ts
describe('My Component', () => {
  it('renders correctly', () => {
  it('handles user input',
  it('displays an error message',
```

```ts
it('Matches DOM Snapshot', () => {
    const domTree = render.create(<Home />).toJSON();
    expect(domTree).toMatchSnapshot();
  });
```

### Challenges of Frontend Testing

Many devs see frontend testing as more difficult and less rewarding than backend testing. After all, it’s much easier to predict how code will work or an API will be consumed than the myriad of ways that a user can interact with the UI. Testing also becomes difficult to do when you’re not unit testing (hint: you should be) or testing something that has a lot of dependencies.

_You should be trying to extract as much business logic from your UI and put it into pure functions, tested via TDD as possible.”_