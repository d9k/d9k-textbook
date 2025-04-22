# Node.js: performance

- :label: (and optimization)

- :point_right: [nodejs-memory](./nodejs-memory.md)

## Использование линтеров и статических анализаторов

CodeQL - Анализ кода через SQL-подобные запросы (от GitHub).
DeepSource - Автоматический анализ кода (поддерживает JS/TS).
Clinic.js - Инструмент от NearForm для профилирования (не совсем статический, но полезен)

Базовые правила ESLint: no-unused-vars, no-undef, no-magic-numbers

eslint-plugin-memory-leak
eslint-plugin-security
eslint-plugin-node
eslint-plugin-promise
eslint-plugin-perf
eslint-plugin-no-loops
eslint-plugin-tree-shaking: tree-shaking/no-side-effects-in-initialization
eslint-plugin-immutable: Запрещает мутации данных, что снижает риск случайных утечек через изменяемые объекты.
eslint-plugin-optimize-regex
eslint-plugin-boundaries
eslint-plugin-prefer-arrow: Рекомендует использовать стрелочные функции для избежания утечек контекста (this).
eslint-plugin-fp: Для функционального программирования: предотвращает мутации и побочные эффекты.
eslint-plugin-no-secrets