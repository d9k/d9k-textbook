# JS stupid questions

Вопросы, которые зачем-то регулярно спрашивают на собеседованиях.

## Типы данных JavaScript

`number`, `bigint`, `boolean`, `undefined`, `null`, `symbol`, `object`.

## var, let и const - разница

https://skillbox.ru/media/code/chem_razlichayutsya_var_let_i_const_v_javascript/

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