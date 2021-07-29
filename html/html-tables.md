# HTML: tables

## Атрибут headers

Позволяет связать ячейки таблицы с заголовками.

`<td headers="address">Улица Ассинизаторов, 69</td>`

## Атрибут scope

`col | colgroup | row | rowgroup`

`scope связывает между собой ячейки с заголовком и обычные ячейки.`

```
<tr>
  <th></th>
  <th scope="col">Месяц</th>
  <th scope="col">Заработано</th>
</tr>
<tr>
  <td scope="row">1</td>
  <td>Январь</td>
  <td>152</td>
</tr>
```
