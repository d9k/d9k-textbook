# bash

## glitch after binary output

https://unix.stackexchange.com/questions/79684/fix-terminal-after-displaying-a-binary-file

`reset`

`alias fix='echo -e "\033c"'`

`alias fix='reset; stty sane; tput rs1; clear; echo -e "\033c"'`

`echo ^v^o`
