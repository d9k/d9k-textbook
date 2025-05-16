# Algorithms: O notation

- :newspaper: [Big O | Alex_BBB | Хабр](https://habr.com/ru/articles/444594/)

## O(1)

```js
const nums = [1,2,3,4,5];
function firstNumber(nums) {
	return nums[0];
}
```

## O(n)

```js
function sum(nums) {
	let sum = 0;
	for(let num of nums){
		sum += num;
	}
	return sum;
}
```

## O(n^2)

Вложенный цикл:

```js
function hasDuplicates(num) {
    for (let i = 0; i < nums.length; i++) {
        const thisNum = nums[i];
        for (let j = 0; j < nums.length; j++) {
            if (j !== i) {
                const otherNum = nums[j];
                if (otherNum === thisNum) {
	                return true;
				}
            }
        }
    }
    return false;
}
```

. . . . .