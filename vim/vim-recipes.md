# Vim: recipes

## vim - Convert ^M (Windows) line breaks to normal line breaks | SO

https://stackoverflow.com/questions/811193/convert-m-windows-line-breaks-to-normal-line-breaks

```
:%s/<Ctrl-V><Ctrl-M>/\r/g
```

Where `<Ctrl-V><Ctrl-M>` means type `Ctrl+V` then `Ctrl+M`.