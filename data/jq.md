# jq

## Filter based on key value

````bash
jq '.data[] | select(.id == "second")'
```

[ndjson - How do I select multiple fields in jq? - Stack Overflow](https://stackoverflow.com/questions/34834519/how-do-i-select-multiple-fields-in-jq)

## Select some object fields

```
jq '{a,b}'
```

https://stackoverflow.com/questions/34834519/how-do-i-select-multiple-fields-in-jq

## Transform array of objects

```
jq "map({ \
    id, \
    name, \
    created: .attributes.created \
  })"
```
