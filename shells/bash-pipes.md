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

## How to redirect and append both standard output and standard error to a file with Bash | SO

https://stackoverflow.com/questions/876239/how-to-redirect-and-append-both-standard-output-and-standard-error-to-a-file-wit

- :zap: `cmd >>file.txt 2>&1`

## sponge vs tee

- :speech_balloon: [linux - Differences between sponge and tee | SO](https://stackoverflow.com/questions/33638511/differences-between-sponge-and-tee/33639324#33639324)

1) Unlike 'tee', 'sponge' doesn't write on stdout, only
2) tee "reads a byte", and "writes that byte" immediately. 'sponge' waits to receive all the input, and then, writes it

```
FILE=/tmp/simple
jq -n '.name="Doe"' > $FILE
jq '.age=18' $FILE | sponge $FILE
cat $FILE
# all ok, { "name": "Doe", "age": 18 }
jq '.age=19' $FILE | tee $FILE
cat $FILE
# empty, file data lost
```