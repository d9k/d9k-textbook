# Bash numbers

## Hex to decimal

```
> echo $((16#abc123))
11256099
> N=abc123
> echo $((16#$N))
11256099
> echo $((0x$N))
11256099
```


## Decimal to hex

```
> printf '%x\n' 11256099
abc123
```
