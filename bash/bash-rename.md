# Bash: переименование

## Add leading zeroes

(single digit, `1. Artist - Song.mp3` -> `01. Artist - Song.mp3`)

`rename -n -e 's/^(\d)\./0$1\./g' -- *.mp3`

## Массовое переименование

Пример: заменить в именах файлов `_` на `-`.

`rename 's/_/-/g' * -vn` - `-n` - тестовый запуск, без изменений. Дальше запустить без ключа `n` на конце

## Удалить имя исполнителя из файла

(удалить до `-`)

`rename -v -n 's/.*- +//' *.mp3`, потом запустить без `-n`

## Переименовать часть имени файла

`vidir` и править как обычный файл, или:

нерекурсивно

	rename 's/ACDC/AC-DC/' *.mp3

рекурсивно

	shopt -s globstar
	# сначала показать список без переименования
	rename -n 's/special/regular/' **

## Поменять местами

`azaz #05.mp3` -> `04 azaz.mp3`:

`rename -n 's/(.*) #(\d+)/$2 $1/' *`
