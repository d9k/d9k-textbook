# Git: ignore

## Ignore local changes

1) В `.git/info/exclude` добавить `vendor/`.

2) Внести изменения

3) Запустить

```
git update-index --skip-worktree `git ls-files -m -- folder_to_exclude`
```

4) Может быть придётся дополнительно запустить `git update-index  --really-refresh`)

На основе https://hashrocket.com/blog/posts/ignore-specific-file-changes-only-on-current-machine-in-git

## Ignore local changes: another recipe

`~/.gitconfig` в секции `[alias]`:

	ignore = update-index --assume-unchanged
	unignore = update-index --no-assume-unchanged
	ignored = !git ls-files -v | grep "^[[:lower:]]"

Использование:

	% git ignore protected/Core/engine.php
	% git ignored
	h protected/Core/engine.php
	% git unignore protected/Core/engine.php

[so:git-ignore-files-only-locally](http://stackoverflow.com/questions/1753070/git-ignore-files-only-locally)
