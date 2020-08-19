# Обработка ошибок в php

## Перехват warning'ов

```
set_error_handler(function() use ($st) {
    $stopHere = 1;
});

// ...

restore_error_handler();
```


## Падает без показа ошибки

включи вывод ошибок строчкой выше

```
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
```

если не сработает, дополнительно заверни в try catch

## Ошибка сервера 500, не логирует

Если лень настраивать конфиги:

`php -d display_errors -f file_with_bugs.php`
