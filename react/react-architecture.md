# Архитектура React

## Что такое State и Props в компонентах?

Props - свойства, работают как html-атрибуты. Вложенный компонент вызывается из метода render() компонента-контейнера в возвращаемой JSX-разметке с заданием props. State - внутреннее состояние компонента.

В общем случае компонент будет перерисовываться при обновлении State или Props.

## JSX

- :point_right: [react-jsx](./react-jsx.md)

## Component rerenders even if props were not changed

Wrap a component in `React.memo` to get a memoized version of that component

### Memoized component re-renders when a prop is an object, array, or function 

When you use memo, your component re-renders whenever any prop is not shallowly equal to what it was previously. This means that React compares every prop in your component with its previous value using the `Object.is` comparison. Note that `Object.is(3, 3)` is true, but `Object.is({}, {})` is false.

Prevent the parent component from re-creating that object every time by using `useMemo`.

You can specify a custom comparison function as a second React.memo argument. Deep equality checks can become incredibly slow and freeze your app for seconds. Functions often close over the props and state of parent components. If you return true when `oldProps.onClick !== newProps.onClick`, your component will keep “seeing” the props and state from a previous render inside its `onClick` handler, leading to very confusing bugs.

## SOLID-принципы в React

- :newspaper: [React Reconciliation: скрытый механизм, управляющий компонентами | Хабр](https://habr.com/ru/companies/timeweb/articles/901212/)

Принцип единственной ответственности (Single Responsibility Principle): каждый компонент должен иметь только одну причину для изменения. Чем меньше у компонента задач, тем ниже вероятность, что он будет повторно рендериться без необходимости.

Инверсия зависимостей (Dependency Inversion): компоненты должны зависеть от абстракций, а не от конкретных реализаций. Это упрощает оптимизацию производительности за счет композиции.

Принцип разделения интерфейса (Interface Segregation): интерфейсы компонентов должны быть минимальными и четко определенными. Чем меньше и чище пропы, тем ниже риск ненужных повторных рендерингов из-за их изменений.

## Управляемые компоненты
- :label: controlled form inputs

- :newspaper: [Контролируемые и неконтролируемые компоненты в React не должны быть сложными | Хабр](https://habr.com/ru/articles/502034/)

Преимущества контролируемых компонентов:
- Валидация формы в реальном времени
- Отключение кнопки при определенном условии
- Обработка определенных форматов форм ввода
- Несколько форм ввода для одной части данных
- Динамические формы ввода

