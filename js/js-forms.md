# JS: forms

## How do you perform form validation using javascript

```html
<form name="myForm" onsubmit="return validateForm()" method="post">
  User name: <input type="text" name="userName" />
  <input type="submit" value="Submit" />
</form>
```

```js
function validateForm() {
  var myForm = document.forms["myForm"];
  var userName = myForm["userName"].value;
  if (userName == "") {
    alert("The username shouldn't be empty");
    return false;
  }
}
```
## What are the DOM methods available for constraint validation

`checkValidity(), setCustomValidity()`

## What are the available constraint validation DOM properties

`validity, validationMessage, willValidate`

## inputEl.validity.* properties

`badInput, customError, patternMismatch, rangeOverflow, rangeUnderflow, stepMismatch, tooLong, tooShort, typeMismatch, valid, valueMissing`

https://developer.mozilla.org/en-US/docs/Web/API/ValidityState