# Настройка git

```
git config --global user.name "FIRST_NAME LAST_NAME"
git config --global user.email "MY_NAME@example.com"
```

## Цветная консоль

`git config --global color.ui auto`

`~/.gitconfig`:

```
	[color]
	diff = auto
	status = auto
	branch = auto
```

## Настройка кодировки

https://confluence.atlassian.com/display/BITBUCKET/Bitbucket+101

## Изменение символа комментария для git commit

`git config core.commentchar ";"`
