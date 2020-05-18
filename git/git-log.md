# Git log

Here’s what I use to review the changes made in the last week. I’ll add --author=jim if I only want to see changes I made.

	git log --all --pretty=format:'%h %cd %s (%an)' --since='7 days ago'

[lab 10](http://gitimmersion.com/lab_10.html)

## Показать текущую ревизию

    git show $(git rev-parse HEAD)

## Найти строку в истории изменения файла

`git log -S string_to_find -- file`

## Найти строку по истории всего проекта

`git log -S string_to_find --source --all`
