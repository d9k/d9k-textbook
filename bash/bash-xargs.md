# Bash: xargs: automate mass file processing

## Names with spaces

`ls -1 *mp3 | tr "\n" "\0" | xargs -0 mplayer`

## Find to xargs

(filenames with ')

t, --verbose: Print the command line on the standard error output before executing it.

`find "/home/d9k/Calibre Library/Tom Mitchiell" | grep "\.txt" | tr '\n' '\0' | xargs -t -0 -L 1 -I{} cp "{}" .`
