# Iterate

## Iterate for string

```
echo -e "$list" | while read -r line; do
	echo "... $line ..."
done <<< "$list"
```

- [Bash: Iterating over lines in a variable - Super User](https://superuser.com/questions/284187/bash-iterating-over-lines-in-a-variable/284192#284192)

## Iterate for array

	array=("one two three")

	for ix in ${!array[*]}
	do
	    printf "   %s\n" "${array[$ix]}"
	done

http://www.linuxjournal.com/content/bash-arrays

## Iterate array reverse

	for (( idx=${#MYARRAY[@]}-1 ; idx>=0 ; idx-- )) ; do
	    echo "${MYARRAY[idx]}"
	done

http://stackoverflow.com/questions/13360091/how-to-reverse-array-in-bash-onliner-for-loop
