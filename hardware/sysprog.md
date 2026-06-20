# Системное программирование

## Interrupts For Programmers Explained (in 2 Minutes) / HuwsTube / YT

https://youtube.com/watch?v=qntoXMY3p5w

Interrupt - event which causes CPU to stop doing what it's currently executing and start running a different piece of code. Mouse click, timer interrupt.

ISR - interrupt service routine. When ISR is finished it returns control to the interrupted code by special instruction (restore the saved PC (programmer counter) and the CPU state).

1:10 ISR have priorities. ISR may be interrupted by a higher priority interrupt. In aircraft engine tempertature interrupt is more important then cabin temperature.

1:25 Writing fast, efficient and bug-free ISRs is definitely not a trivial task. Squeak/Pharo.