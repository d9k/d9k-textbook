# Architecture: FSD

https://feature-sliced.design/

This methodology is for front-end projects only. If you're looking for a back-end architecture, consider [Clean Architecture](./arch-clean.md)_.

## Архитектура Frontend FSD+ - Ulbi TV

https://youtu.be/c3JGBdxfYcU
## 1. Простая (классическая)

компоненты в одну кучу (бизнес и абстрактные)

## 2. Модульная

перенос принципа инкапсуляции из ООП  - функционал разбит по модулям (store + компоненты)

(->): использование. Нижележащие не могут использовать вышележащие

Pages (макс. тонкая) -> Modules (сложные куски страниц) -> Components (композиция UI-элементов) -> UI (-kit, -элементы)

Каждый модуль может содержать: api, components, constants, helpers, store. index - реэкспорт только компонентов для использования в других модулях, на страницах (глав. компонент, reducer)

Пример модулей: RegistrationForm, InfiniteUsersList, ArticleCommments

Недостатки: что если модуль нужно использовать в другом модуле? Где хранить бизнес-сущности?

## 3. Атомная архитетура

atoms (kit без бизнес-логики) <- molecules <- organisms (похожи на modules) | templates (с "дырками" для компонентов) <- pages

Удобно дизайнерам

Минус: опять нет чёткой бизнес-ориентированности

## 4. Feature-sliced design

Слой, Слайс, Сегмент

слой, у каждого своя зона ответственности, строго 8:

- app - entry point, инициализир. логика приложения, глобальные стили, декларации с типами, providers/: store, skin, роутинг, styles/
- processes - процессы приложений, протекающие над несколькими страницами (например, поэтапная форма)
- pages - перечисление widgets и features, обёрнутое в layout
- widgets - макс. самост. компоненты (Sidebar, and Header, Navbar, WallPostCard). Содержит! entity, в пустые слоты которых вставлены features
- features - модули, несущие бизнес-ценность, реализ. пользовательские сценарии (AuthByPhone, ArticleFeedback, ChangeLanguage). Одна фича - один модуль
- entities - конкретные бизнес-сущности: User, Article, Product, Contruct, ProductDescription, Productcharacteristics)
- shared - переисп. модули, без привязки к бизнес-логике (UI-kit или служебный код)

Вышележащие используют только нижележащие, однонпр. поток данных.
Чем ниже слой, тем опаснее в него вносить изменения.

Слайс - отдельная сущность в слое.

Сегменты, в каждом слайсе:

- UI - виз. компоненты
- model - бизнес-логика, state, selector, thunk, action
- lib - вспом. ф.-и (helpers/, hooks/, content/, [type/?])
- config (i18n, storybook)
- api - взаимод. с сервисами (axios, rtkQuery; mappers/: подготовка к отправке данных/преобраз. получ. данных)
- const
- assets
- types

вышележащие используют только нижележащие, однонпр. поток данных

Принципы ООП:
абстракция, полиморфизм - достигаем засчет слоёв
инкапсуляция - public API слоя
наследование - вышележащие слои исп. нижележащие [но это включение?!]

Для слабого зацепление нужно писать модули так, чтобы их было легко удалить

Модуль должен быть сильно связан ~ должен решать одну конкретную задачу

Adaptility -  т. к. модули обладают чёткой зоной ответственности, их легко заменять, удалять, модифицировать

Бизнес-ориентированность методологии.

Контролируемые связи.

## 5. Микрофтронтенды и монорепозиторий

Пример микросервисов: Админ-панель, B2B, Интернет-магазин, Новостная лента

Выделяем переиспользуемые между микрофронтендами npm-пакеты:
Общие модули, UI-kit, конфигурация, основные бизнес-сущности и константы. Отдельные UI modules (все слои, кроме app - этот слой и pages будет в микрофронтендах)

У каждого свой Storybook.

Интсрументы: pnpm/yarn workspaces, nx, lerna, bit, single-spa, webpack module federation

Недостатки: сложно, долго, желателен отдельный человек, ответственный за монорепу

## More on FSD

- A very simple app of a single page might not need the benefits of FSD and suffer from the overhead. However, FSD promotes a nice way of thinking, so feel free to use it on the tiniest projects if you want.