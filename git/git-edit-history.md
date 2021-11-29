# Git edit history

`git rebase -i HEAD~3`

`pick`
`squash`
`rebase`

https://git-scm.com/docs/git-rebase

## С gitlab

лучше правки по review сохранять в fixup'е
`git commit --fixup=COMMIT_HASH`

а после approv'а
`git-squash MASTER_COMMIT_HASH`, где `MASTER_COMMIT_HASH` - из какого commit'а master'е растут изменения в ветке

COMMIT_HASH для fixup'а, где был последним изменён файл
если файлы из нескольких коммитов, нужно правильно разбить fixup, каждый набор файлов для "своего" коммита

если много фиксапов, можно забэкапить ветку перед squash'ем (просто создать новую, потом удалить, если всё ок)
если случайно фиксап не к тому коммиту:

команда `git reset HEAD~` отменяет предыдущий коммит (но изменения локально сохраняются, их можно перекоммитить)

либо команда `git commit --amend --fixup=NEW_COMMIT_HASH` заменяет хэш предыдущего коммита

после squash'а надо пушить командой git push `--force-with-lease`
