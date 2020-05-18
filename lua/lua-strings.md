# lua strings

## Получение google spreadsheet url is url

(см. https://developers.google.com/sheets/api/guides/concepts)

Из `https://docs.google.com/spreadsheets/d/abcdefgh1234567890/edit?usp=sharing` в `abcdefgh1234567890`:

```
function (url)
  return url:match("/spreadsheets/d/(.+)/")
end
```

http://lua-users.org/wiki/PatternsTutorial
