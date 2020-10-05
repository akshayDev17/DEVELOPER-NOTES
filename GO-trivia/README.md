# History

1. developed in 2007 by Robert Griesemer, Rob Pike and Ken Thompson at Google but launched in 2009 as an *open-source programming language*
2. supports environment adopting patterns alike to dynamic languages. For eg., type inference (`y := 0` is a valid declaration of a variable `y` of type `float`, here the variable `y` doesn't need to be declared before being assigned a value, that's why its called environment adopting patterns).



* `Go` distribution comes as a binary installable.



### Why Golang?

* Because Go language is an effort to combine the ease of programming of an interpreted, dynamically typed language(for instance python) with the efficiency and safety of a statically typed, compiled language(for instance C/Java). 
* It also aims to be modern, with support for networked and multi-core computing.
* There are no forward declarations(declare the function , but don't define it) and no header files(unlike C/C++); everything is declared exactly once.
* There is no explicit type-hierarchy, i.e. no top-type is present, which , however *`interface{}`* is the **universal-base** class in Golang, which is a **compile-time static type**.
  * variables of type `interface` can accept any object value, but do not reflect real run time types that an object can have in the type system, so are not top types in the first regard(with regards to the existence of a universal-base class).



## Hardware optimisations

1. Golang has been designed in such a way that instead of using threading it uses **`Goroutine`**, which is similar to threading but consumes very less memory.
2. threading consumes 1MB whereas Goroutine consumes 2KB of memory.

### Goroutine vs Threads

1. Goroutines have growable segmented stacks.
2. Goroutines have a faster startup time than threads.
3. Goroutines come with built-in primitives to communicate safely between themselves (channels).
4. Goroutines allow you to avoid having to resort to mutex locking when sharing data structures.
5. Goroutines are multiplexed onto a small number of OS threads, rather than a 1:1 mapping.
6. can write massively concurrent servers withouth having to resort to evented programming.