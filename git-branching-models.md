# Git: branching models

- :label: Модели ветвления

- :newspaper: [Git Workflow | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/comparing-workflows)

## Centralized workflow

For teams transitioning from `Subversion`

## Feature branching

- :newspaper: [Модель ветвления Feature Branch Workflow](https://bitworks.software/2018-12-10-git-feature-branch-workflow.html)

Основная идея модели Feature Branch Workflow заключается в том, что вся работа над новой функциональностью должна производится в отдельной ветке, а не в ветке master.

- Позволяет легко распараллеливать работу
- Нерабочий код никогда не попадет в ветку master
- В master можно добавлять функционал только через pull request'ы
- Создание отдельной ветки позволяет вести обсуждения по созданным изменениям через запросы на объединение.

## Gitflow Workflow

- :newspaper: [Модель ветвления Gitflow](https://bitworks.software/2019-03-12-gitflow-workflow.html)
	- Перевод :newspaper: [Gitflow Workflow | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

A strict branching model designed around the project release.

Приписывает особые роли разным веткам Feature branch workflow.

`git-flow` консольная утилита как расширение git.

В ветке `master` хранится официальная история релиза, а ветка `develop` служит в качестве интеграционной ветки для новых функций.

Feature-ветки мержатся через pull-request'ы в develop.

Когда в ветку `develop` уже слито достаточно нового кода для релиза (или подходит установленная дата предрелиза), от ветки `develop` создается ветка `release` (напр., `release/v0.2.0`). Создание данной ветки означает начало следующего цикла релиза, в ходе которой новая функциональность уже не добавляется, а производится только отладка багов, создание документации и решение других задач, связанных с релизом. Когда все готово, ветка release сливается в master, и ей присваивается тег с версией. Когда в ветку `develop` уже слито достаточно нового кода для релиза (или подходит установленная дата предрелиза), от ветки `develop` создается ветка `release`. Создание данной ветки означает начало следующего цикла релиза, в ходе которой новая функциональность уже не добавляется, а производится только отладка багов, создание документации и решение других задач, связанных с релизом. Когда все готово, ветка `release` сливается в master, и ей присваивается тег с версией (напр., `v0.2.0`). Кроме того `master` должна быть также слита обратно в ветку `develop`, в которой с момента создания ветки релиза могли добавляться изменения.

Использование отдельной ветки для подготовки релиза позволяет одной команде дорабатывать текущий релиз пока другая команда уже работает над функциональностью для следующего релиза.

Ветки `hotfix` очень похожи на ветки release и feature, за исключением того, что они созданы от `master`, а не от `develop`. Можно говорить о ветках `hotfix` как об особых ветках `relese`, которые работают напрямую с `master`.


## Forking Workflow

Gives every developer a server-side repository.

## Trunk based development

- :newspaper: [Подход Trunk-Based Development в разработке | BitWorks](https://bitworks.software/2019-03-22-trunk-based-development.html)
- :newspaper: [Почему Trunk Based Development – лучшая модель ветвления. Андрей Александров | chemtech | Хабр](https://habr.com/ru/articles/519314/), 2020

По статистике исследования State Of DevOps 2019 производительность компании напрямую коррелирует с практиками и конкретно с Trunk Based Development.

- Короткоживущие ветки - новые ветки живут < 2 дней
- :sparkles: Мастер всегда готов к релизу, даже если в нём есть недописанные фичи

Когда я раньше писал код за деньги, у меня была большая боль. В чем была проблема? У меня есть большой pull request. Я в нем сделал кучу абстракций, полей в базе данных и прочее. И они уже нужны в других фичах. Но мы не можем это переиспользовать, потому что у меня еще не все готово. И мы не можем это смержить. А Trunk позволяет все это делать, потому что у нас Feature Flags как обязательный подход.

### Feature flags

- Все следующие шаги без этой штуки сделать не получится
- Большая часть фич оборачивается в Feature Flags.
- Позволяет деплоить код, который ещё не готов
- Можем делать A/B тесты.
- Можем шарить код между недоработанными фичами.


### Мы делаем ветки для абстракций, а не для feature

- branch by abstraction

:newspaper: [Как применять Branch by Abstraction в проекте на примере Android-разработки | maxkachinkin | Хабр](https://habr.com/ru/companies/dododev/articles/652029/)

Или другой вариант. Вы работали и постоянно подливали себе основную ветку, чтобы код сильно не расходился. Делаете pull request, он висит несколько дней, после этого вы получаете approve и ... 15 конфликтов. Кто-то слил свой большой pull request раньше.


### Continuous code review

## :robot_face: Choosing branching model for small and large team - разговор с DeepSeek 2025.05.18

| Gitflow (C)                         | Trunk-Based (D)                       |
|-------------------------------------|---------------------------------------|
| ✅ Clear separation of concerns      | ✅ Rapid integration & deployment      |
| ✅ Scales for complex release cycles | ❌ Requires advanced CI/CD discipline  |
| ❌ Overhead for small teams          | ❌ Riskier for large, fragmented teams |

