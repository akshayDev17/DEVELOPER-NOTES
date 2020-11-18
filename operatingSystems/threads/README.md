# Table of Contents





1. threads = basic unit of execution, within a process.
   1. a process can have 1-many threads.







* In general each *thread* has its own registers (including its own program counter), its own stack pointer, and its own stack. 
* **Everything else is shared** between the threads sharing a process.
* In particular a *process* is generally considered to consist of a set of threads sharing an address space, heap, static data, and code segments, and file descriptors.
  * There is some additional process state shared by all the threads in a process, things like the process id, the signal handling, and file locks.
* Most modern operating systems have added a notion of [*thread local storage*](https://en.wikipedia.org/wiki/Thread-local_storage), which are variables of global scope that are not shared. 
  * The usual example of the use of this is for the variable `errno`. 
  * That's a single variable of global scope, but in most modern operating systems each thread is given its own local copy, so that an error in a library call on one thread won't impact the behaviour of other threads.
* when a function is called from a thread, Stack variables are copied but heap variables are same.