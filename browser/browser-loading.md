# Browser: loading

## Что происходит в момент запроса в браузере?

- https://t.me/easy_javascript_ru/1355
- [Как работают браузеры - Web Performance | MDN](https://developer.mozilla.org/ru/docs/Web/Performance/Guides/How_browsers_work)

Когда пользователь вводит URL в адресную строку браузера и нажимает Enter, происходит ряд шагов для получения и отображения запрашиваемой веб-страницы. Этот процесс включает взаимодействие различных компонентов сети и веб-технологий.

### Ввод URL и начало запроса

Пользователь вводит URL в адресную строку браузера. Браузер проверяет кэш браузера для определения, есть ли сохраненная копия запрашиваемого ресурса. Если ресурс найден в кэше и он актуален, страница загружается из кэша, минуя сетевые запросы.

### DNS-разрешение

Если ресурс не найден в кэше, браузер выполняет запрос к DNS-серверу для преобразования доменного имени (например, www.example.com) в IP-адрес сервера.

### Установление TCP-соединения

После получения IP-адреса браузер устанавливает TCP-соединение с сервером. Этот процесс включает в себя трехэтапное рукопожатие "SYN-SYN-ACK":
- Браузер отправляет SYN-пакет серверу.
- Сервер отвечает SYN-ACK пакетом.
- Браузер отправляет ACK-пакет, подтверждая установление соединения.

### HTTPS и SSL/TLS

Если URL использует HTTPS, происходит дополнительный этап установки защищенного соединения с использованием SSL/TLS:
Браузер и сервер обмениваются сертификатами и выполняют шифрование данных.

### Отправка HTTP-запроса

Браузер отправляет HTTP-запрос на сервер. Например, для получения главной страницы сайта может быть отправлен следующий запрос:

```
GET / HTTP/1.1
Host: www.example.com
```

### Обработка запроса на сервере

Сервер принимает запрос, обрабатывает его, генерирует ответ и отправляет его обратно клиенту. Сервер может выполнять различные задачи, такие как доступ к базе данных, обработка логики приложения и рендеринг страниц.

### Получение и обработка HTTP-ответа

Браузер получает HTTP-ответ от сервера. Ответ включает в себя статусный код, заголовки и тело (содержимое) ответа. Пример HTTP-ответа:

```html
HTTP/1.1 200 OK
Content-Type: text/html
Content-Length: 1234

<!DOCTYPE html>
<html>
<head>
<title>Пример страницы</title>
</head>
<body>
<h1>Добро пожаловать!</h1>
</body>
</html>
```

### Пакетирование TCP slow start

TTFB - это время между моментом когда пользователь отправил запрос, скажем, нажав на ссылку, и моментом получения первого пакета данных HTML.

Объём первого пакета данных - всегда 14KB. Это часть спецификации TCP slow start - алгоритма, который балансирует скорость соединения. Такое правило позволяет постепенно, по мере необходимости, увеличивать размеры передаваемых данных, пока не будет определена максимальная ширина канала.

Каждый следующий отправленный сервером пакет увеличивается в размере в два раза. Размер второго пакета будет около 28КБ. Если сервер отправит слишком много пакетов за раз - они могут быть отброшены. Поэтому браузер должен реагировать на получение пакетов ответом-подтверждение Aknowledgements (ACK).

### Парсинг и рендеринг страницы

Как только браузер получает первый кусочек HTML-документа он начинает его парсинг. Во время парсинга получаемые данные преобразуются в DOM (см. [jd-dom](../js/js-dom.md)) и объектную модель CSS (CSSOM), которые напрямую участвуют в отрисовке.

Браузер начинает парсинг HTML-документа. Этот процесс включает построение DOM (Document Object Model). В процессе парсинга HTML браузер может обнаруживать ссылки на другие ресурсы, такие как CSS, JavaScript, изображения и шрифты, и отправлять дополнительные HTTP-запросы для их загрузки.

### Блокирующие и неблокирующие ресурсы

Когда парсер находит неблокирующие ресурсы (например, изображения), браузер отправляет запрос на загрузку ресурсов, но сам продолжает обработку. Обработка может продолжаться когда обнаружена ссылка на CSS файл, но `<scrpt>` без параметров `async` или defer считается блокирующим и приостанавливает обработку HTML до завершения загрузки скрипта.

CSS не блокирует парсинг HTML, но он блокирует JS, т. к. в скриптах часто используется выборки узлов документа по CSS-селекторам.

Сканер предзагрузки обрабатывает доступное содержимое документа и запрашивает высокоприоритетные ресурсы (CSS, JavaScript и шрифты). Благодаря этому сканеру нам не нужно ждать, пока парсер дойдёт до конкретного места, где вызывается ресурс. Он запрашивает и получает эти данные заранее, в фоновом режиме,

### AOM

Браузер также строит дерево объектной модели доступности, которое используется устройствами-помощниками для понимания и интерпретирования контента. Accessibility object model, AOM - это семантическая версия DOM. Браузер обновляет AOM в тот же момент, когда обновляется DOM. В то же время, дерево доступности не может быть изменено вспомогательными технологиями. Пока AOM не построена, содержимое страницы недоступно для голосовых помощников и считывателей экрана

### CSSOM

Обработка CSS и построение дерева объектной модели CSS (CSSOM). Оно настолько быстрое, что чаще всего включается в показатель "Повторное вычисление стилей (Recalculate Styles)" в средствах разработчика. Браузер начинает построение модели с наиболее общих правил для каждого узла, постепенно применяя более специфичные правила. Другими словами, он применяет правила каскадно. Отсюда и название CSS - Cascading Style Sheets.

### Компиляция

Скрипты преобразуются в абстрактное синтаксическое дерево (AST - Abstract Syntax Tree). Некоторые браузеры отдают AST в компилятор, преобразующий дерево в байт-код. Скрипты исполняются в основном потоке. Весь этот процесс называется компиляцией.

### Выполнение JavaScript

После компиляции браузер начинает выполнение встроенных и внешних JavaScript-скриптов. JavaScript может изменять DOM и CSSOM (CSS Object Model), что приводит к изменениям в отображении страницы.
JavaScript также может отправлять асинхронные запросы (AJAX) для динамической загрузки данных и обновления страницы без перезагрузки.

### Рендеринг

Этапы рендеринга включают в себя стилизацию, компоновку (layout), отрисовку (paint) и, в некоторых случаях, композицию (composition). CSSOM и DOM деревья комбинируются в дерево рендера, которое затем используется для расчёта положения каждого видимого элемента. Скрытые (display: none) и невидимые (вроде `<head>`) элементы не включаются в дерево рендеринга.

Layout/Reflow: Браузер, учитывая размер видимой области, определяет какие размеры элементов на экране. Вычисление начинается с элемента body в дереве рендеринга, затем переходит к его потомкам. Резервирует место для элементов, размеры которых он ещё не знает (например, изображения). Момент, когда позиция и размеры узлов вычислены, называется layout. Последующие вычисления позиций и размеров называются reflow.

Paint: Последний шаг критического пути рендеринга - это отрисовка каждого отдельного узла на экране. Момент, когда это происходит впервые, называется first meaningful paint (первая значащая отрисовка).

Для обеспечения плавной прокрутки и анимаций в 60 кадров в секунду содержимое может быть вынесено на отдельные слои и совмещено (composition) - такой подход увеличивает производительность, позволяя отрисовывать содержимое экрана на графическом процессоре вместо ЦПУ. Это освобождает основной поток.
Элементы с CSS-свойствами `opacity`, `transform` и `will-change` будут отрисованы на их собственном слое, вместе с их потомками.

## Метрики по оптимизации страницы

- :beginner: [Lighthouse performance scoring | Chrome for Developers](https://developer.chrome.com/docs/lighthouse/performance/performance-scoring)
- :newspaper: [What's New In Lighthouse 8.0? | DebugBear](https://www.debugbear.com/blog/lighthouse-v8)

- :robot_face: разговор с DeepSeek
	- :speaking_head_in_silhouette: _Расскажи про метрики Lighthouse. По каждой метрике дай максимально полные определения, что является и не является метрикой._

### Lighthouse score

Lighthouse 8 score:

| Audit                    | Weight |
|--------------------------|--------|
| First Contentful Paint   | 10%    |
| Speed Index              | 10%    |
| Largest Contentful Paint | 25%    |
| Time to Interactive      | 10%    |
| Total Blocking Time      | 30%    |
| Cumulative Layout Shift  | 15%    |

### Timeline

```
TTFB → FP → FCP → SI → TBT → TTI → FCI → FID → LCP → INP → VC → FLT → CLS
```

### Core Web Vitals

- [Measure And Optimize Core Web Vitals | DebugBear](https://www.debugbear.com/docs/metrics/core-web-vitals)

LCP, FID, CLS

### TTFB

***Time-to-first byte***

- [Reduce server response times | Lighthouse | Chrome for Developers](https://developer.chrome.com/docs/lighthouse/performance/server-response-time)

Что измеряет: Время между отправкой HTTP-запроса (например, переход по ссылке) и получением первого байта данных от сервера.

Цель: Оценить скорость реакции сервера и сети.

As well as including the server response time, TTFB can often include DNS lookups and redirects. Lighthouse tests will test the end URL, missing the redirect time.

Что учитывается:
- DNS-запросы.
- Установка TCP-соединения.
- SSL-рукопожатие (для HTTPS).
- Время генерации ответа сервером.

Что не учитывается: Загрузка всей страницы (только первый байт), рендериг и т. д.

### FCP

***First Contentful Paint***

- :beginner: [Measure And Optimize First Contentful Paint (FCP) | DebugBear](https://www.debugbear.com/docs/metrics/first-contentful-paint)
- :beginner: [First Contentful Paint (FCP) | Articles | web.dev](https://web.dev/articles/fcp)

Что измеряет: Время появления первого элемента контента (текст, изображение, фон).

Цель: Показать начальную отзывчивость страницы.

Что учитывается:
- Первое отображение любого контента.
- Что не учитывается:
- Полная загрузка страницы.
- Интерактивность элементов.

### SI

- :beginner: [Speed Index | Lighthouse | Chrome for Developers](https://developer.chrome.com/docs/lighthouse/performance/speed-index?hl=en)
- :beginner: [What is Lighthouse Speed Index (SI) And How to Reduce It  | NitroPack](https://nitropack.io/blog/post/google-page-speed-index)
- https://developer.chrome.com/docs/lighthouse/performance/speed-index

***Speed Index*** - Скорость отображения видимого контента. Цель: Показать, как быстро страница визуально наполняется.

Что учитывается: Прогресс визуального отображения в течение загрузки.

Что не учитывается:
- Интерактивность элементов.
- Контент, загружаемый после начальной отрисовки.

Как вычисляется: покадровое сравнение скриншота страницы модулем [speedline](https://github.com/paulirish/speedline).


### TBT

- :beginner: [Total Blocking Time | Lighthouse | Chrome for Developers](https://developer.chrome.com/docs/lighthouse/performance/lighthouse-total-blocking-time?hl=en)
- :newspaper: [Measure And Optimize Total Blocking Time (TBT) | DebugBear](https://www.debugbear.com/docs/metrics/total-blocking-time)
Total Blocking Time - Общее время, когда задачи в основном потоке блокировали взаимодействие дольше 50 мс (сумма превышений). Цель: Выявить периоды, когда страница не реагировала на ввод.

Что учитывается:
- Учитываются ***только*** задачи между FCP (момент, когда пользователь видит первый контент) и TTI (момент, когда страница готова к взаимодействию). Между этими этапами браузер часто занят "доводкой" страницы, и длительные задачи в этот период создают ощущение "зависания".
- Долгие JavaScript-задачи:
	- Загрузка и выполнение скриптов (например, `main.js`, `analytics.js`).
	- Обработка данных (например, сортировка больших массивов).
	- Инициализация виджетов/плагинов (например, слайдеры, модальные окна).
- Парсинг HTML/CSS:
	- Анализ разметки и стилей, особенно для тяжелых страниц.
- Стили и макет (Layout/Reflow):
	- Применение CSS-стилей.
	- Перерасчет геометрии элементов (например, при изменении размеров окна).
- Обработчики событий, которые выполняются синхронно.

Что не учитывается:
- Кратковременные блокировки (менее 50 мс).
- Задачи после того, как страница стала интерактивной (TTI).
- Асинхронные операции: `setTimeout`, `fetch`, `Promise`, Web Workers — не блокируют основной поток.
- Рендеринг в Compositor Thread: CSS-анимации с transform/opacity, которые обрабатываются отдельным потоком.

### TTI

***Time to Interactive*** - время, когда страница полностью готова к взаимодействию:
- Основной поток свободен (нет длительных задач >50 мс).
- Загружены все критически важные ресурсы.

Цель: Определить момент, когда пользователь может свободно кликать, скроллить и т.д.

Что учитывается:
- Выполнение JavaScript.
- Загрузка шрифтов, стилей.

Что не учитывается:
- Фоновые процессы (например, кэширование изображений).
- Асинхронные задачи (Web Workers, setTimeout).

### FCI

***First CPU idle***

Что измеряет: Время, когда страница минимально готова к обработке пользовательского ввода (основной поток частично свободен).

Цель: Показать момент, когда страница перестает "зависать" при простых взаимодействиях.

Что учитывается:
- Завершение загрузки критических ресурсов.
- Короткие периоды простоя основного потока.

Что не учитывается:
- Полная интерактивность (это TTI).
- Фоновые задачи (аналитика, ленивая загрузка).

### FID

***First Input Delay*** — задержка между первым действием пользователя (клик, нажатие) и откликом браузера.

Цель: Оценить отзывчивость страницы.

Что учитывается:
- Только первое взаимодействие.
- Время блокировки основного потока (main thread).

Что не учитывается:
- Последующие взаимодействия.
- События без участия пользователя (например, автоматическая загрузка).
- Время выполнения обработчиков событий (только задержка до их запуска).

Примечание: FID постепенно заменяется на INP (Interaction to Next Paint), который анализирует все взаимодействия

### LCP

- [Как измеряются метрики сайта: LCP, FID и CLS](https://tproger.ru/articles/kak-izmerjajutsja-metriki-sajta-lcp-fid-i-cls)

***Largest Contentful Paint*** — Время загрузки самого крупного контентного элемента в зоне видимости (viewport).
**Цель:** Показать, когда основное содержимое страницы становится видимым.

**Что учитывается:**
- Элементы: изображения, видео, текстовые блоки, SVG.
- Только элементы в viewport.

**Что не учитывается:**
- Элементы за пределами viewport.
- Динамически добавляемый контент после начальной загрузки.
- Мелкие элементы (например, иконки).

Как улучшить:
- Оптимизируйте изображения (сжатие, современные форматы вроде WebP).
- Внедрите кэширование и предзагрузку критических ресурсов.
- Используйте CDN для ускорения доставки контента.

### INP

- :newspaper: [INP: что это и зачем с этим работать | Хабр](https://habr.com/ru/companies/docdoc/articles/802329/)

***Interaction to Next Paint*** - общая задержка между действием пользователя и отрисовкой следующего кадра в браузере. Цель — оценить отзывчивость страницы при **всех взаимодействиях**, а не только первом. INP выбирает наибольшую задержку из всех взаимодействий на странице.

Впервые INP был представлен ещё в 2022 году. Метрика изначально рассматривалась в качестве замены FID, поскольку даёт больше подробной и прикладной информации. Так, FID оценивает время от клика до реакции сайта, но учитывает только первый контакт, а INP оценивает скорость отклика на протяжении всего взаимодействия с сайтом. Более того, FID больше ориентирован на оценку технической скорости отклика, а INP — визуальной.

Что входит в INP?
- Все взаимодействия пользователя: Клики, нажатия клавиш, тач-события. Взаимодействия с формами, кнопками, меню. Даже быстрые повторные клики (например, двойное нажатие).
- Полный цикл обработки события: Время от начала действия (например, клик) до отображения визуального отклика (например, изменение цвета кнопки).
- В метрику входит самое медленное взаимодействие из всех

Что не входит в INP?
- Взаимодействия без визуального отклика
- Автоматические события: инициированные скриптами, а не пользователем (например, `element.click()`).
- Анимации и переходы, не связанные с действиями пользователя: CSS-анимации, запущенные автоматически.
- Асинхронные задачи вне основного потока: `Web Workers`, `setTimeout`, `fetch`, `requestIdleCallback`.
- Действия, выполненные до момента Time to Interactive (TTI).

Как улучшить?
- Удаляйте неиспользуемые обработчики.
- Переносите тяжелые вычисления в Web Workers.
- Используйте асинхронные методы для операций с DOM (requestAnimationFrame, Intersection Observer)
- Используйте CSS-анимации вместо JavaScript. Используйте `transform` и `opacity` для анимаций (они не влияют на макет). Применяйте `will-change: transform` для сложных анимаций.
- Избегать Layout Thrashing - отделять чтение данных геометрии от его изменения (разбивать один цикл на два отдельных цикла)

### VC

***Visually Complete*** — Момент, когда все визуальные элементы страницы отрисованы в зоне видимости (viewport).

Цель: Показать, когда страница выглядит "завершенной" для пользователя.

Что учитывается:
- Изображения, видео, текст, SVG.
- CSS-анимации и трансформации.

Что не учитывается:
- Интерактивность элементов.
- Контент, загружаемый лениво (например, при скролле).

### FLT

***Fully loaded time*** — время, когда все ресурсы страницы (включая фоновые) загружены и сетевые запросы завершены.

Цель: Оценить полное время загрузки страницы.

Что учитывается:
- Изображения, скрипты, стили, шрифты.
- Асинхронные запросы (API, аналитика).
- Ресурсы, загруженные после начального рендеринга.

Что не учитывается:
- Интерактивность страницы.
- Производительность основного потока.

### CLS

Cumulative Layout Shift (CLS) - Суммарный балл визуальных смещений элементов в течение жизни страницы. Цель: Оценить визуальную стабильность.

Что учитывается:
- Непреднамеренные смещения (например, подгрузка изображений без резервирования места).
- Расстояние смещения и область влияния (viewport fraction).

Что не учитывается:
- Анимации и переходы, инициированные пользователем.
- Изменения, происходящие вне viewport.

Как улучшить:
- Всегда задавайте размеры для изображений и видео (width, height, aspect-ratio).
- Избегайте вставки динамического контента поверх существующего (например, рекламных баннеров).
- Используйте резервные контейнеры для лениво загружаемых элементов.

## Оптимизация скорости загрузки страницы

### Minimize Main-thread Work

- :beginner: [What is Lighthouse Speed Index (SI) And How to Reduce It  | NitroPack](https://nitropack.io/blog/post/google-page-speed-index)

- Removing unused JS by only loading the JavaScript necessary for the initial view (above the fold)
- Avoiding forced synchronous layouts by batching style changes and layout reads so they aren't done close together
- Using the contain property for your CSS to limit the area that needs re-layouting or repainting.
- Moving non-UI tasks (like data processing or complex calculations) to a Web Worker, which runs in a separate thread instead of the main one
- Choosing CSS animations over JavaScript-based ones
- Using the transform and opacity properties for animations, as they're optimized by the browser's compositor thread and don't burden the main thread.
- Ensuring images are appropriately sized and lazy loading the ones that fall below the fold

### Reduce JavaScript Execution Time

 - :beginner: [What is Lighthouse Speed Index (SI) And How to Reduce It  | NitroPack](https://nitropack.io/blog/post/google-page-speed-index)

- Removing any redundant or unnecessary code
- Combining similar functions
- Refactoring loops by using forEach or map instead of traditional for loops where appropriate
- Minifying your JS files, making them smaller and faster to download and execute
- Implementing async or defer attributes to your script tags so they are downloaded in the background without blocking the page
- Removing any unused libraries or plugins and finding light-weight alternatives to current libraries
- Breaking your JS into smaller chunks that can be loaded on demand
- Enabling browser caching to avoid redownloading JS files on repeat visits Reduce JavaScript Execution Time
- The main goal here is to optimize your JavaScript code so that it runs more efficiently and takes less time to execute. For your visitors, this would mean a significant decrease in delays and page unresponsiveness.

## Атрибуты `<script>` async, defer

- :beginner: [Скрипты: async, defer | javascript.ru](https://learn.javascript.ru/script-async-defer)

Когда браузер загружает HTML и доходит до тега `<script src="...">`, он не может продолжать строить DOM. Он должен сначала загрузить и выполнить скрипт.
- Скрипты не видят DOM-элементы ниже себя, поэтому к ним нельзя добавить обработчики и т.д.
- Если вверху страницы объёмный скрипт, он «блокирует» страницу. Пользователи не видят содержимое страницы, пока он не загрузится и не запустится:

`<script defer` сообщает браузеру, что он должен продолжать обрабатывать страницу и загружать скрипт в фоновом режиме, а затем запустить этот скрипт, когда DOM дерево будет полностью построено (событие `DOMContentLoaded`).

Скрипты с `defer` загружаются параллельно, но запускаются в порядке объявления в коде страницы.

`defer` используются для скриптов, которым требуется доступ ко всему DOM и/или важен их относительный порядок выполнения.

`<script async`: скрипты не блокируют рендеринг, не ждут друг друга и не дожидаются `DOMContentLoaded`.

Usability: При использовании `defer`-скриптов необходимо отображать индикацию загрузки, блокировать нерабочие кнопки.

`async` хорош для независимых скриптов, например счётчиков и рекламы, относительный порядок выполнения которых не играет роли.`

## Динамически загружаемые скрипты

- :beginner: [Скрипты: async, defer | javascript.ru](https://learn.javascript.ru/script-async-defer)

```js
let script = document.createElement('script');
script.src = "/article/script-async-defer/long.js";
document.body.append(script); // (*)
```
Динамически загружаемые скрипты по умолчанию ведут себя как `async`. Чтобы изменить это поведение, нужно поменять свойство `script.async = false;`



