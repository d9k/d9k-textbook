# Architecture: SSR

## SSR vs. CSR, ISR, SSG

- :newspaper: [Что такое SSR, CSR, ISR и SSG, и что из этого выбрать — Веб-Разработка](https://quasi-art.ru/library/it/ssr-csr-isr-ssg-guide)

- ___CSR (Client-Side Rendering)___ - обычный рендеринг в браузере
	- Подходит для личных кабинетов и внутренних корпоративных порталов.

- ___SSR (Server-Side Rendering)___ - Когда пользователь запрашивает страницу, сервер генерирует HTML и отправляет всю страницу браузеру. Браузер сразу же отображает страницу, после JS и CSS догружаются и выполняются.
	- Подходит для высоконагруженных интернет-магазинов, где важно SEO и контент-платформ.

- SSG (Static Site Generation) - В процессе сборки все страницы предварительно компилируются в виде статических HTML-файлов, включая все данные, которые могут быть известны на момент сборки. Может не подойти для высокодинамичного контента.
	- Содержимое сайта меняется редко и важна производительность. Блоги, сайты документации, лэндинги.

- ISR (Incremental Static Regeneration) - позволяет частично регенерировать статические страницы во время сборки и во время выполнения. ISR обеспечивает баланс между производительностью и интерактивностью, что позволяет использовать его для динамических, но часто посещаемых страниц.
	- В процессе сборки некоторые страницы предварительно отображаются как статический HTML, а другие помечаются как "неактуальные". Когда пользователь запрашивает "неактуальную" страницу, сервер регенерирует ее «на лету» и кэширует результат для последующих запросов.
