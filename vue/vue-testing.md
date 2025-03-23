# Vue: testing

## :robot_face: Тестирование Vue 3 визуальных компоненты и composables - разговор с DeepSeek 2025.03.22

> Как именно лучше покрывать тестами визуальные компоненты и composables, написанные на Vue 3? Расскажи про лучшие практики и рекомендации.

### :jigsaw: Библиотеки

- **@testing-library/user-event**: Для имитации действий пользователя.
- **Testing Library/Vue** (опционально): Для тестирования с фокусом на поведении, а не реализации.

### Как тестировать vue-компоненты:

- Рендеринг контента на основе пропсов и слотов.
- Реакцию на пользовательские события (клики, ввод).
- Изменение состояния (например, v-model).
- Условный рендеринг (v-if, v-show).
- Взаимодействие с дочерними компонентами.

```js
import { mount, flushPromises } from '@vue/test-utils';

const wrapper = mount(ButtonComponent);
await flushPromises(); // Ждем завершения асинхронных операций
await wrapper.find('button').trigger('click');
expect(wrapper.emitted()).toHaveProperty('click');

expect(wrapper.text()).toContain('Submit');

expect(wrapper.html()).toMatchSnapshot(); // Только для статичных компонентов.

expect(() => mount(Component)).toThrow(); // if required prop is missing

expect(wrapper.find('.error').element).toHaveStyle('color: red'); // динамические стили

// Для компонента с v-model
const wrapper = mount(Component);
await wrapper.find('input').setValue('New value');
expect(wrapper.emitted('update:modelValue')[0]).toEqual(['New value']);

// Если нужно дождаться timeout
vi.useFakeTimers();
await wrapper.find('button').trigger('click');
vi.advanceTimersByTime(1000); // Пропускаем 1 секунду
expect(someResult).toBe(true);

// Тест на accessibility (a11y):
import { axe } from 'jest-axe';
const axeResults = await axe(wrapper.element);
expect(axeResults).toHaveNoViolations();
```

### Советы по тестированию vue-компонентов:

- Тестируйте через **роли** (aria-атрибуты), а не классы/идентификаторы.
- Избегайте проверки внутреннего состояния компонента (`wrapper.vm.someProperty`).

### Как тестировать composables:

- Возвращаемые реактивные значения (`ref`, `reactive`).
- Побочные эффекты (`watch`, `watchEffect`).
- Аргументы и конфигурацию.
- Очистку ресурсов (`onUnmounted`).

```js
import { renderHook } from '@testing-library/vue';

const { result } = renderHook(() => useCounter());
expect(result.current.count.value).toBe(0);
await result.current.increment();
```

### Советы по тестированию composables

- Для сложных сценариев создавайте тестовый компонент-обертку.

## :robot_face: #mock -тестирование - разговор с DeepSeek 2025.03.22

- Очищайте моки между тестами через `vi.clearAllMocks()` в `afterEach`.

```ts
// Нужно мокать Pinia хранилище и API-запрос
vi.mock('@/stores/auth', () => ({
  useAuthStore: () => ({
    setUser: vi.fn(),
  }),
}));

// Мокируйте внешние зависимости:
vi.mock('axios', () => ({
     get: vi.fn(() => Promise.resolve({ data: 'mock-data' })),
}));

// Мок Vue Router
const mockRouter = { push: vi.fn() };
mount(Component, {
 global: {
   mocks: { $router: mockRouter }
 }
});

// Мок компонента v-calendar
mount(MyComponent, {
 global: {
   stubs: ['VCalendar']
 }
});
```

`vi` это [vitest](../tdd/tdd-vitest.md).

### Антипаттерны использования mock при тестировании composables

Хрупкие тесты: Тесты ломаются при изменении внутренней логики мока (даже если сам composable работает правильно). Моки нужно постоянно актуализировать под изменения в коде.
1. **Принимать зависимости через аргументы** Вместо `useStore()` внутри composable — передавать хранилище как параметр.
2. **Избегать импорта Vue-контекста** Не использовать `inject()`, `provide()`, `useRouter()` напрямую в composable.
3. **Выносить побочные эффекты** Работу с API, LocalStorage, таймерами — в отдельные слои, которые можно подменить в тестах.
4. **Декомпозировать логику** Разбивать composable на мелкие функции, которые тестируются по отдельности.

### **Когда моки все же нужны?**

Иногда без них не обойтись, например:
- **Тестирование интеграции** с Vue Router или DOM.
- **Работа с глобальными объектами** (например, `window.location`).
- **Сложные сценарии** (ошибки сети, таймауты). Но даже в таких случаях:
	- Используйте минимальные моки (например, `vue-test-utils` для компонентов).
	- Изолируйте тесты с моками от юнит-тестов composables.