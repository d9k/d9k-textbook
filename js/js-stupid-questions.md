# JS stupid questions

Вопросы, которые зачем-то регулярно спрашивают на собеседованиях.

## Типы данных JavaScript

`number`, `bigint`, `boolean`, `undefined`, `null`, `symbol`, `object`.

## var, let и const - разница

[Var, let и const в JavaScript: в чём разница между переменными в JS / Skillbox Media](https://skillbox.ru/media/code/chem_razlichayutsya_var_let_i_const_v_javascript/)
```
var x = 50;

function func() { 
  var x = 10; 
  //Будет выведено 10
  console.log(x);

  //Будет выведено 50
  console.log(window.x); 
}
```

```
function showPodcast() { 
	//Вызовем переменную перед её объявлением 
	best_podcast = 'people and code'; 
	if (false) {
		var best_podcast; 
	} 
	console.log(best_podcast); 
} 

showPodcast(); //Ошибки не будет, браузер выведет undefined
```

Переменные, объявленные с помощью `let`, нельзя объявить повторно — программа выдаст ошибку. `let`-переменные тоже «всплывают», но при попытке обратиться к ним до инициализации вы получите ошибку `ReferenceError`.

Попытка изменить значение константы приведёт к ошибке - `TypeError`?

Неизменяемым сохраняется сам `const`-объект, а не его поля: