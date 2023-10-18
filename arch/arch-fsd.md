# Architecture: FSD

- https://feature-sliced.design/
- [Layers | Feature-Sliced Design](https://feature-sliced.design/docs/reference/layers#%D1%85%D0%B5%D0%B4%D0%B5%D1%80-%D0%BF%D1%80%D0%B8%D0%BB%D0%BE%D0%B6%D0%B5%D0%BD%D0%B8%D1%8F)
- [Examples | Feature-Sliced Design](https://feature-sliced.design/docs/guides/examples)

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

![FSD|450](https://raw.githubusercontent.com/d9k/d9k-textbook-assets/main/arch/arch-fsd/layers-3d-visual-representation.png)

Слой, Слайс, Сегмент

слой, у каждого своя зона ответственности, строго 8:

- app - entry point, инициализир. логика приложения, глобальные стили, декларации с типами, providers/: store, skin, роутинг, styles/
- processes - процессы приложений, протекающие над несколькими страницами (например, поэтапная форма)
- pages - перечисление widgets и features, обёрнутое в layout
- widgets - макс. самост. компоненты (Sidebar, and Header, Navbar, WallPostCard). Содержитd entity, в пустые слоты которых вставлены features
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
- styles

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
- No mapping in Interactor. When we pass data across a boundary, it is always in the form that is most convenient for the inner circle. Поэтому в Interactor данные должны попадать уже в нужном ему виде. Маппинг происходит в слое Interface Adapters, то есть в Presenter и Repository.
- Один модуль не должен использовать другой модуль, расположенный на том же слое или на слоях выше. Например, фича А не должна импортировать фичу B. В противном случае модули перестают быть изолированными друг от друга и теряют устойчивость к новыми требованиям. Когда мы модифицируем фичу B, мы неявно изменяем и фичу A. В небольшом приложении, возможно, это не так критично. Но чем больше людей работает над проектом и чем объемнее кодовая база, тем сложнее держать в голове все связи между модулями. Данное правило позволяет стандартизировать этот процесс, упрощает рефакторинг и модификацию модулей.
- Layouts (templates) в Anifox расположены в `widgets/`, а в `realworld-react-fsd` в `pages/`

- [Заблуждения Clean Architecture / Хабр](https://habr.com/ru/companies/mobileup/articles/335382/)

## FSD cheatsheet

## Choosing a layer

![choosing a layer|600](https://raw.githubusercontent.com/d9k/d9k-textbook-assets/main/arch/arch-fsd/choosing-a-layer.png)

https://feature-sliced.design/docs/get-started/cheatsheet

## Examples

- https://feature-sliced.design/examples