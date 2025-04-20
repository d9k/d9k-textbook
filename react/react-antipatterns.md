# React: antipatterns

## Как избежать props drilling?

1) Использовать Redux, MobX и подобные state-менеджеры.
2) Либо `<Provider>` + useContext.
3) `render*`-props. Например, завести prop `renderHeader()`, возвращающий JSX-разметку `ReactNode` вместо передачи `headerColor`, `headerSize`.
4) Можно использовать и глобальное состояние, но это антипаттерн.