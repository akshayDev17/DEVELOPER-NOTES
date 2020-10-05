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



### Features

1. **Package Management:** 
   1. Go merges modern day developer workflow of working with *Open Source projects* and includes that in the way it manages external packages. 
   2. Support is provided directly in the tooling to get external packages and publish your own packages in a set of easy commands.
2. **Static Typing**
   1. compiler not just works on compiling the code successfully but also ensures on type conversions and compatibility. 
   2. Because of this feature Go avoid all those problems which we face in dynamically typed languages.
3. **Testing Support:** 
   1. Go provides us the unit testing features by itself i.e., a simple mechanism to write your unit test parallel with your code because of this you can understand you code coverage by your own tests.
   2. And that can be easily used in generating your code documentation as an example.
4. **Platform Independent:** 
   1. Go language is just like Java language as it support platform independency.
   2. Due to its modular design and modularity i.e., the code is compiled and is converted into binary form which is as small as possible and hence, it requires no dependency.
   3. Its code can be compiled in any platform or any server and application you work on.



## Advantages vs Disadvantages

| Advantages                                                   | Disadvantages                                                |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| garbage collection - key feature, control over memory allocation, reduced latency in most recent versions of garbage collector | no support for generics, even if there are many discussions on it |
| validates for the interface and type embedding               | not as much object-oriented as in the conventional sense     |
|                                                              | absence of a UI tool-kit                                     |





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



**Some popular Applications developed in Go Language**

- Docker: a set of tools for deploying linux containers
- **Openshift:** a cloud computing platform as a service by Red Hat.
- **Kubernetes:** The future of seamlessly automated deployment processes
- **Dropbox:** migrated some of their critical components from Python to Go.
- **Netflix:** for two part of their server architecture.
- **InfluxDB:** is an open-source time series database developed by InfluxData.