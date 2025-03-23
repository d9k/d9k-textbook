# Architecture: stateful/stateless

## веб сервер - Что такое Stateless и Statefull? - Stack Overflow на русском, 2021

- https://ru.stackoverflow.com/questions/1242990/Что-такое-stateless-и-statefull

Storage session to redis: можно не "гонять" стейт между клиентом и сервером - достаточно идентификатора сессии. Тогда та нода, на которую "упал" клиентский запрос, быстренько "поднимет" сессию из редиса.