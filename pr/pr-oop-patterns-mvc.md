# Programming: OOP patterns: MVC

## MVP

- https://ru.wikipedia.org/wiki/Model-View-Presenter
- :newspaper: [Что такое MVP / Skillbox Media](https://skillbox.ru/media/code/chto_takoe_mvp_i_kak_eto_ispolzovat/)

Presenter управляет и Моделью и Представлением. Например извлекает данные из Модели и форматирует их для отображения в Представлении.

```cs
public class MyPresenter
{
    private readonly IView _view;
    private readonly IModel _model;

    public MyPresenter(IModel model, IView view)
    {
        _view = view;
        _model = model;
    }

    public void Start()
    {
        _model.Numbers.Add(view.ReadA());
        _model.Numbers.Add(view.ReadB());
        _view.WriteSum(model.Sum());
     }
}

public static void Main()
{
    MyModel model = new();
    MyConsoleView view = new();
    MyPresenter presenter = new MyPresenter(model, view);
    presenter.Start();
}
```

Можно легко заменить консольный интерфейс `MyConsoleView`, например, на `MyWindowsFormsView`.

## MVVM-паттерн

- в общем, используется больше в C#, Java.
	- Controler обрабатывает действия на frontend.
	- паттерн для упрощённого биндинга данных
	- Классический MVC для обновления целиком. MVVM - для AJAX-обновлений.

- [gh: java fx MVVM](https://github.com/sialcasa/jfx-mvvm)
- [java zk MVVM](https://www.zkoss.org/wiki/Small_Talks/2011/November/Hello_ZK_MVVM#MVP_Implementation)

## mvc и mvp

в MVP Модель не общается с Представлением даже опосредовано.
в MVC Модель, на самом деле, является медиатором между Контроллером/Представлением и реальной моделью домена (Domain Model) приложения. В MVP-же, такого медиатора нет и его функции берет на себя Presenter, таким образом Presenter, в отличие от Контроллера, общается непосредственно с моделью приложения. Presenter в отличии от Контроллера, обладает необходимыми знаниями о Представлениях, а так же удаляет лишнюю логику обработки событий от Модели из Представления.

Фаулер выделяет три возможных модификации MVP: Presentation Model, Supervising Controller и Passive View. Все они отличаются способами передачи данных представлению. Если мы передаем в Представление бизнес-объекты вместо примитивных типов, то это Presentation Model; если позволили Представлению знать о модели и самому забирать из нее данные, то это Supervising Controller; а если логика Представления действительно минимальна то с нами Passive View.

Существуют модификации паттерна, позволяющие выстроить определенную иерархию: Hierarchical Model-View-Controller (HMVC) и Presentation-Abstraction-Control (PAC), который пришел из Java. Отличие заключается в том, что HMVC позволяет выстраивать независимые иерархии, отдельно для Представлений, отдельно для Контроллера/Presenter-а, ну и само-собой для Модели, с прямыми ссылками между собой, то есть, например, Представление может ссылаться непосредственно на дочернее Представление. В свою очередь PAC, более строгий паттерн, и предписывает иметь связи между собой только Контроллерам, другие сущности доступны извне исключительно через свой Контроллер.

http://www.rsdn.ru/article/patterns/ModelViewPresenter.xml

