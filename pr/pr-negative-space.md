# Negative space programming

- :label: and contract programming

- :tv: [This Is A Game Changer | The YT](https://www.youtube.com/shorts/M-VU0fLjIUU)

programming invariance (`assert`)

## Exploring the Power of Negative Space Programming — Double Trouble

- https://double-trouble.dev/post/negativ-space-programming/

****Negative space programming is a concept that embraces the art of defining a program by what it should not do, rather than what it should.***

Negative space programming involves placing constraints and assertions throughout your code to explicitly define invalid states and conditions. By doing this, you ensure that the code fails fast and early, preventing unintended behaviors from propagating through the system. This method not only enhances the reliability of the software but also documents the developer’s expectations clearly, offering a dual benefit of validation and communication.

Testing for min/max values (loop run count too).

```zig
const std = @import("std");
const assert = std.debug.assert;

fn calculateArea(width: i32, height: i32) i32 {
    assert(width > 0);
    assert(height > 0);
    return width * height;
}
```

It is essential to keep assertions in your production code. Assertions allow your program to check its own logic continuously, ensuring that it runs correctly even under the unexpected conditions often encountered in production. By defining and enforcing negative space, you significantly reduce the risk of undetected bugs causing severe issues.

## TigerStyle! (Or How To Design Safer Systems in Less Time) by Joran Dirk Greef, 2024

- https://www.youtube.com/watch?v=w3WYdYyjek4

Time = Design + Coding + Testing + Incidents

Edsger Dijkstra: "The simple and elegant systems tend to be easier and faster to design and get right, more efficient in execution, and much more reliable."

Additional time spend on design can speed up other phases by several times.

My favorite coder is Kevin Flynn \[from TRON?\] and Kevin saw perfection to software what he called Biodigital Jazz.

Two types of musicians: sculptors (Bob Marley) and painters (Beatles).

The most software nowadays is sculpted. You take all these dependencies like a big block of marble.

Four colors: Network, Disc, Memory, CPU.

Back of the Envelope Calculations. Evade spikes.

Define your fault models. For ex. memory: use ECC.

Memory allocation failure must be safely handled. You can't just panic if you're database.

Reduce surface area - easier deploy, less ports, resources, simple modules interfaces.

Zero technical debt for Tiger Beetle

Walk & Talk.

Tiger style will slow you down in a way that accelerates all other fases.

NASA's Power of Ten Rules for Safery Critical Code - _\[limit language expression power for good\]_

Lay a tripwires. Jamie putted the bugs in PR to check whether reviewers will find them :)

Assertions for all argument and return values in functions. Self-verifying code.

The ultimate purpose of abstraction is for correctness.

Beginner programmer thinks _"if it compiles it's correct"_.

Programmers think in positive space by default: how to succeed, how to compile.

Hackers think in negative space: how to make fail.

Environment is going to attack you.

Often deadlock is caused by infinite `while`-loop. If you limit your loop with assertions you going to figure it out much quicker.

Tiger Beetle figures out all needed resources ahead of time.

Assert example: `assert(mem.eql(u8, block_cache, block_disk))` - checks if readed block from disk and memory are equal.

Golang discorauge assertions, advices to handle error. But if you can predict a bug, why not fix it? Bugs caught by assertions can't be predicted. It's undefined behavior. There is no proper handling: you're into undefined logic territory. The safest thing to do is shutdown safely.

There is cost to shutting down. But the cost to not doing so is greater. Imagine corrupting thousands of financial transactions every second.

Distributed systems run several processes of the same thing in the cluster. So they expect some processes will crash and can't be restarted. Just restart process as fast as possiible.

Zig is a fantastic language for writing databases.

Zig encourages you to do assertions. If your numeric type overflows doing addition you gonna get nice stack trace. Enabled by default.

Block-disabled assertions for performance critical blocks.

Zig lets you to do assertions at compile-time. You can check program design integrity before it even executes.

Assertions document your invariants. Programmers see what should work and what should't.

Corrupt disk simulation to test replication! This simulator helped to find 30 bugs immediately after beginning of use.

52:00 Replica leader election

With Zig you can compile in WASM.

## MSDN Magazine: Cutting Edge - Invariants and Inheritance in Code Contracts | Microsoft Learn, 2011

- https://learn.microsoft.com/ru-ru/archive/msdn-magazine/2011/june/msdn-magazine-cutting-edge-invariants-and-inheritance-in-code-contracts

Инвариант — это условие, которое всегда дает true в данном контексте.

Контракт инварианта формально определяет условия, при которых экземпляр класса считается находящимся в допустимом состоянии.

Проектирование, управляемое предметной областью (domain-driven design, DDD), теперь является проверенной временем методологией для моделирования сложных бизнес-сценариев, где инвариантной логике отводится значимое место.

DDD рекомендует писать фабрики классов, которые возвращают объекты в допустимом состоянии, и делать так, чтобы после каждой операции ваши объекты возвращались в допустимое состояние.

Как в DDD, так и в реализации Code Contracts инварианты должны проверяться при выходе из любого открытого метода, включая конструкторы и аксессоры set.

```cs
[ContractInvariantMethod]
private void ObjectInvariant() {
  Contract.Invariant(!String.IsNullOrEmpty(Title))
```

Вкладка "code contracts" настроек проекта -> Perform Runtime Contracts Checking: Full / Pre and Post / Preconditions / Release Requires / None

## Что такое инвариант?

https://ru.stackoverflow.com/questions/858650/Что-такое-инвариант-в-ООП

### by Monk

Инварианты в коде обычно выглядят:

* Как транзакции - какие то изменения, которые либо прошли целиком, либо целиком откатились.

* Как валидации перед сохранением - которые либо дали сохранить изменения, либо упали с ошибкой о некорректном состоянии.

* В целом, любое исключение может оказаться следствием поддержки инварианта - обеспечение целостности, частный случай - `ObjectDisposedException`.

* Функциональные программы часто инвариантны, т.к. не меняют состояние исходного объекта.

* Приватные поля объекта, которые может менять только сам объект, плюс каждый публичный метод меняет их из рабочего и согласованного состояния в рабочее и согласованное состояние.

### by Pavel Mayorov

В коде инварианты чаще всего никак не выражены, но иногда ставятся защитные проверки которые их проверяют.

Примеры инвариантов.

`List<>: 0 ≤ _size ≤ _items.Length`

`List<>.Enumerator: list.version = const = version;` есть защитная проверка

`List<>.Enumerator: 0 ≤ index ≤ list._size + 1`

## NASA: The Power of Ten – Rules for Developing Safety Critical Code

https://spinroot.com/gerard/pdf/P10.pdf

### Rule 5: The assertion density of the code should average to a minimum of two assertions per function.

Assertions must always be side-effect
free and should be defined as Boolean tests. When an assertion fails, an explicit
recovery action must be taken, e.g., by returning an error condition to the caller of the
function that executes the failing assertion.

Assertions can be used to verify pre- and postconditions of functions, parameter values, return values of functions, and loopinvariants.

\[Limit data sharing between modules. Each component should manage its own data, reducing dependencies and side effects.\]

\[Prevents Race Conditions: In concurrent systems, localized data reduces synchronization risks.\]

### Rule 6: Data objects must be declared at the smallest possible level of scope.

Rationale: If an object is not in scope, its value cannot be referenced or corrupted. This rule supports a basic principle of data-hiding. Similarly, if an erroneous value of an object has to be diagnosed, the fewer the number of statements where the value could have been assigned; the easier it is to diagnose the problem. The rule discourages the re-use of variables for multiple, incompatible purposes, which can complicate fault diagnosis.