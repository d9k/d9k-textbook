# Base pipes

## Merge pipes

My bad example:

`{ find . | grep "\.c" ; find . | grep "\.h" } | xargs wc -l`

https://askubuntu.com/questions/133386/how-to-merge-and-pipe-results-from-two-different-commands-to-single-command

## Merge stdout and stderr to pipe

`cmd-doesnt-respect-difference-between-stdout-and-stderr 2>&1 | grep -i SomeError`

https://stackoverflow.com/a/16497456/1760643

## prefix output with date (for logging)

`sudo apt install coreutils`

`my-command 2>&1 | ts "%F %T |"`
