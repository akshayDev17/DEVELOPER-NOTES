# Table of Contents

1. [Compile-time vs Runtime](#crt)









# Compile-time vs Run-time<a name="crt"></a>

1. compile-time:
   1. instance where code  is converted to executable
   2. error occurred due to typing mistake, if we do not follow the proper **syntax** and **semantics** of any programming language then compile time errors are thrown by the compiler. 
   3. code is run, only after syntax-errors are rectified, 
2. run-time:
   1. instance where the executable is run





# Statically types vs Dynamically typed language<a name="stdt"></a>

| Statically types                                             | Dynamically typed                                            |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| programmer must specify what type each variable is(eg Java, C, C++) | type is associated with run-time values, and not named variables/fields/etc.<br /><br />programmer can write a little quicker because you do not have to specify types every time (unless using a statically-typed language with *type inference*). |
| some languages offer some form of *type inference*, the capability of the type system to deduce the type of a variable (e.g.: OCaml, Haskell, Scala, Kotlin) | Most scripting languages have this feature as there is no compiler to do static type-checking anyway, but you may find yourself searching for a bug that is due to the interpreter misinterpreting the type of a variable.<br /><br />Luckily, scripts tend to be small so bugs have not so many places to hide. |
| The main advantage here is that all kinds of checking can be done by the compiler, and therefore a lot of trivial bugs are caught at a very early stage. | Most dynamically typed languages do allow you to provide type information, but do not require it. |

