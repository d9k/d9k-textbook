# Linux: renaming files

## Add leading zeroes

(single digit, `1. Artist - Song.mp3` -> `01. Artist - Song.mp3`)

`rename -n -e 's/^(\d)\./0$1\./g' -- *.mp3`
