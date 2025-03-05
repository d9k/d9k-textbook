# TypeScript: about language

## Type system

TypeScript type system: duck, gradual, structural, unsound.

https://en.wikipedia.org/wiki/Structural_type_system

***Gradual typing***: Some variables and expressions may be given types and the correctness of the typing is checked at compile time (which is static typing) and some expressions may be left untyped and eventual type errors are reported at runtime (which is dynamic typing).

***Structural type system***: type compatibility and equivalence are determined by the type's actual structure or definition and not by other characteristics such as its name or place of declaration.

**Duck typing:*** an object is of a given type if it has all methods and properties required by that type. Duck typing is similar to, but distinct from, structural typing. Structural typing is a ***static*** typing system that determines type compatibility and equivalence by a type's structure, whereas duck typing is ***dynamic*** and determines type compatibility by only that part of a type's structure that is accessed during runtime.

***Type punning***: programming technique that subverts or circumvents the type system of a programming language in order to achieve an effect that would be difficult or impossible to achieve within the bounds of the formal language.

medium.com/@thejameskyle/type-systems-structural-vs-nominal-typing-explained-56511dd969f4

***Flow typing***: https://en.wikipedia.org/wiki/Flow-sensitive_typing - \[guards in TS\]

***Sound type system***: only accepts programs with correct types. If a type system accepts some programs that violate their stated types then we say that it's "unsound"