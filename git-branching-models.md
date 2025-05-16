# Git: branching models

- :newspaper: [Git Workflow | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/comparing-workflows)

## Centralized workflow

For teams transitioning from `Subversion`

## Feature branching

- :newspaper: [Модель ветвления Feature Branch Workflow](https://bitworks.software/2018-12-10-git-feature-branch-workflow.html)

The core idea behind the Feature Branch Workflow is that all feature development should take place in a dedicated branch instead of the main branch.

## Gitflow Workflow

- :newspaper: [Gitflow Workflow | Atlassian Git Tutorial](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)

A strict branching model designed around the project release.

## Forking Workflow

Gives every developer a server-side repository.

## Trunk based development

- :newspaper: [Почему Trunk Based Development – лучшая модель ветвления. Андрей Александров | chemtech | Хабр](https://habr.com/ru/articles/519314/), 2020

- Короткоживущие ветки - новые ветки живут < 2 дней

### Feature flags

- Все следующие шаги без этой штуки сделать не получится
- Большая часть фич оборачивается в Feature Flags.
- Позволяет деплоить код, который ещё не готов

.....

- branch by abstraction
- continuous code review
- :sparkles: Мастер всегда release ready

