# Table of Contents

1. [Compile-time vs Runtime](#crt)
2. [Statically types vs Dynamically typed language](#stdt)
3. [Compiled Type languages vs Interpreted-type Languages](#ctit)
   1. [A simple analogy](#compiled-vs-interpreted-analogy)
   2. [Differences](#compiled-vs-interpreted-differences)
   3. [Intermediate Approach](#ia)
4. [Platform](#platform)
5. [Pointers](#pointers)
6. [Garbage Collection](#garbage-collection)
7. [Hash-maps vs BST](#maps)
8. [Function-stack](#function-stack)
9. [Stackoverflow](#stackoverflow)









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





# Compiled Type languages vs Interpreted-type Languages<a name="ctit"></a>



## A simple analogy<a name="compiled-vs-interpreted-analogy"></a>

Imagine you have a hummus recipe that you want to make, but it's written in ancient Greek. There are two ways you, a non-ancient-Greek speaker, could follow its directions.

The first is if someone had already translated it into English for you. You (and anyone else who can speak English) could read the English version of the recipe and make hummus. Think of this translated recipe as the *compiled* version.

The second way is if you have a friend who knows ancient Greek. When you're ready to make hummus, your friend sits next to you and translates the recipe into English as you go, line by line. In this case, your friend is the interpreter for the *interpreted* version of the recipe.



## Differences<a name="compiled-vs-interpreted-differences"></a>



| Compiled type                                                | Interpreted Type                                             |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| a program called the **compiler** goes through a written source code, and ***translates*** it into machine code, in a separate file(executable) | code is *interpreted* through line by line, it isn't translated and separate into machine code, in a separate file<br />This is what an **interpreter** does. |
| this executable can then be shared among different devices, and each of these receiving devices can run this, without ever needing the source code on the system | code is interpreted *on the fly*                             |
|                                                              | eg. JavaScript, since code for each website is sent when a request is made to that website through a browser, and the interpreter in the browser understands this code and translates it into whatever we see. |
| ![equation](https://latex.codecogs.com/gif.latex?%7B%5Ccolor%7BGreen%7D%20%5Ctextrm%7BAdvantages%7D%7D)<br />once compiled, ready to run, send executable all over, for other machines to run, rather than sending the code itself<br /><br />can be optimised for CPU, hence faster<br /><br />source code can be **kept private**, the executable can be made public. | ![equation](https://latex.codecogs.com/gif.latex?%7B%5Ccolor%7BGreen%7D%20%5Ctextrm%7BAdvantages%7D%7D)<br /><br />cross-platform, since the source code is the one being sent, which should in-principle be acceptable by various *kinds of machine*<br /><br />simpler to test(no in-between compile step)<br /><br />easier to debug(since all access to source-code) |
| ![equation](https://latex.codecogs.com/gif.latex?%7B%5Ccolor%7BRed%7D%20%5Ctextrm%7BDISAdvantages%7D%7D)<br />not cross-platform, i.e. if OS changes(from windows to MAC), executable file won't work across these(even on the same platform it sometimes needs to be compiled separately, because of this cross-platform issue) <br /><br />inflexible<br /><br />compilation is an extra-step that the developer has to take in-order to test it, | ![equation](https://latex.codecogs.com/gif.latex?%7B%5Ccolor%7BRed%7D%20%5Ctextrm%7BDISAdvantages%7D%7D)<br />have to have an interpreter to understand and execute the code(interpreter is usually a virtual machine, unique to that particular OS, i.e. windows/mac/unix)<br /><br />often slower, every time a program is to be run, this *interpretation* step is needed to be carried out<br /><br />source code is public |
| eg. C, C++ objective-C                                       | eg. PHP, JavaScript, most command line tools, CLIs, and shells can theoretically be classified as interpreted languages, *python in an interactive mode* |
| <img src="compiled.png" />                                   | <img src="interpreted.png" />                                |



## Intermediate Approach<a name="ia"></a>

1. compile the code into an *intermediate language*
   1. translate the source code along a way to machine code, while still being portable in cross-platforms
2. distribute this *intermediate language* to the client, who will then run it, via translating this into a complete machine code format
   1. just-in-time or JIT compilation
3. intermediate language = *Byte-code*
4. **Java**, C#, VB.NET, **Python**
   1. Java:
      1. compiled into bytecode by JRE(java runtime environment)
      2. bytecode then interpreted by jvm(java virtual machine)
      3. the `.class` is the bytecode file(generated after `javac x.java`.
      4. The one which makes the byte code generated in Windows OS to be executed in the UNIX OS is the JVM of UNIX platform.



# Platform<a name="platform"></a>

* combination of processor and OS(operating system). 
* the hardware or software component in which programs run.
* program in C/C++ on compilation is directly converted into machine readable language(.exe). 
  * This .exe file generated is specific to the operating system i.e, when you compile program in windows OS, the .exe file generated for that program is specific to only windows OS and cannot be made to run in UNIX OS.
  * Thats why C/C++ programs are platform dependent. 
  * Here .exe file is the Native code.
* **Native code** is similar to machine code i.e codes that is understood by machine. 
  * Native codes are **specific to platform** i.e, Native code generated by program for Windows OS is different from Native code generated for the same program for Unix OS.
* On the other hand, **Byte codes** are nothing but intermediate codes generated after compilation and it is **not the executable code like Native code**. 
  * The Byte code requires a virtual machine to execute in machine. 
  * Byte codes generated by one platform can be executed in another platform also.





# Pointers<a name="pointers"></a>

1. store address of some variable

2. memory address stored always in hexadecimal format

3. `0x` = first address location, 0 in hexadecimal, first pointer, also called null-pointer

4. these aren't some normal int type variables that store a hexadecimal address value

   1. ```go
      // Golang program to demonstrate the variables 
      // storing the hexadecimal values 
      package main 
        
      import "fmt"
        
      func main() { 
        
          // storing the hexadecimal 
          // values in variables 
          x := 0xFF 
          y := 0x9C 
            
          // Displaying the values 
          fmt.Printf("Type of variable x is %T\n", x) 
          fmt.Printf("Value of x in hexdecimal is %X\n", x) 
          fmt.Printf("Value of x in decimal is %v\n", x) 
            
          fmt.Printf("Type of variable y is %T\n", y) 
          fmt.Printf("Value of y in hexdecimal is %X\n", y) 
          fmt.Printf("Value of y in decimal is %v\n", y)     
            
      } 
      ```

   2. output:

      ```bash
      Type of variable x is int
      Value of x in hexdecimal is FF
      Value of x in decimal is 255
      Type of variable y is int
      Value of y in hexdecimal is 9C
      Value of y in decimal is 156
      ```

   3. although the variables `x` and `y` store a hexadecimal number that represents valid memory-address locations, these are just plain user-defined variables, and don't exactly point to any address locations.

5. pointers, in addition to storing a hexadecimal address of a memory location, **also point to it**

6. they provide a way to find out what is stored in that memory location(`*p`, where \* = <u>de-referencing</u> operator).

   1. `&` operator is the address operator, used to store address of a variable inside a pointer-variable.





# Garbage Collection<a name="garbage-collection"></a>

1. simpler words: 
   *collecting or gaining memory back which has been allocated to objects but which is not currently in use in any part of our program.*
2. process in which programs try to free up memory space that is no longer used by objects.
3. Most high-level programming languages have some sort of garbage collection built in. 
   1. Low-level programming languages may add garbage collection through libraries.
   2. In C programming, developers need to take care of memory allocation and deallocation using `malloc()` and `dealloc()` functions. 
   3. But, in the case of C# developers don't need to take care of GC and it’s not recommended either.
4. in C objects are placed in memory wherever there is free space that fits the size of the object. 
   1. hence this leads to increased time for searching an appropriately sized memory block, and then allocating it.



## Pros of GC<a name="gc-pros"></a>

* saves time for programmers
  * `malloc(), free()` have to be used in C by the programmer as part of garbage collection
  * no need to do this for languages that have inbuilt garbage collection



## Cons of GC<a name="gc-cons"></a>

* negative impact on performance, in terms of that this process has to be repeated at some periodic intervals
* these repeated checks take up resources and often requires the program to pause.



## Best time for GC<a name="best-time-gc"></a>

* If an object has no references (is no longer reachable) then it is eligible for garbage collection.

* ```java
  class Useless {
    public static void main (String[] args) {
    Thing thing1 = new Thing();
    Thing thing2 = new Thing();
    thing2 = thing1; // direct thing2's reference towards thing1
                     // no references access thing2
  } }
  ```

  * the Thing object originally referenced by `thing2` has its one and only reference redirected to another object(`thing1`) on the heap. 
  * This means it is then unreachable and will have its memory unallocated by the garbage collector.
  * objects are assigned as pass-by-reference in JAVA.





# Memory Allocation in programming languages<a name="mem-alloc-PL"></a>



## Stacks<a name="mem-stack"></a>

* memory allocation has to be contiguous
* de-allocation happens in the exact **reverse** order as that of allocation
* this scheme of allocation has no holes
* this scheme is perfect for nested/recursive function calls
  * each function invocation allocates memory for its local variables and then de-allocates it when it returns
* Allocation and de-allocation on the stack is extremely easy - just increment or decrement the stack pointer



## Heaps<a name="mem-heap"></a>

* need to allocate things and then de-allocate them in a different order
  * for instance a data-structure like a linked-list or a tree
  * in such a case, heaps are the only option
*  You can allocate any chunk and de-allocate it when you place. 
* A memory heap can have *holes*
* Also typically a stacks size is limited and it grows downwards, but the heap is managed by the OS and grows upwards to fill the entire process memory quota or the entire virtual memory.





# Hash-Map vs BST<a name="maps"></a>

| Hash-map                                                     | BST                                                          |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| &theta;(1) time - search, insert, delete                     | O(Log(n)) time - search, insert, delete                      |
| unordered_map in cpp                                         | **self-balancing BST** = map in cpp(ordered map, the order being the insertion of keys into the map) |
|                                                              | doing order statistics - find next greatest/next lowest element, range queries, better with BSTs |
| with Hashing, Θ(1) is average time and some particular operations may be costly, especially when table resizing happens. | With Self-Balancing BSTs, all operations are guaranteed to work in O(Logn) time. |



# Function-stack<a name="function-stack"></a>

1. maintains the local variables and parameter values during function execution

2. dynamic entity - grows as more and more function calls take place, shrinks as more and more of the calls in the stack return

3. The starting address of the first stack frame is chosen arbitrarily. 

   1. In most cases, it is not important where it starts, only to understand the mechanics of how it grows and shrinks.

4. ```c
    1: #include <stdio.h> 
    2: 
    3: int mogrify(int a, int b){
    4:   int tmp = a*4 - b / 3;                  // First line of mogrify (mogrify)
    5:   return tmp;                             // (mogrify_return)
    6: }
    7: double truly_half(int x){
    8:   double tmp = x / 2.0;                   // First line of turly_half (truly_half)
    9:   return tmp;                             // (truly_half_return)
   10: }
   11: int main(){
   12:   int a = 7, y = 17;                      // First line of main (main)
   13:   int mog = mogrify(a,y);                 // Call to mogrify (mogrify_call)
   14:   printf("Done with mogrify\n");          // (first_print)
   15: 
   16:   double x = truly_half(y);               // Call to truly_half (truly_half_call)
   17:   printf("Done with truly_half\n");       // (second_print)
   18: 
   19:   a = mogrify(x,mog);                     // (mogrify2)
   20: 
   21:   printf("Results: %d %lf\n",mog,x);      // (last_print)
   22:   return 0;                               // (main_return)
   23: }
   ```

5. initial state of stack(**before even executing the first line of main, i.e. line number 12**):
   the program knows the local variables, and just declares them some garbage value.

   | method | line | var  | value | Address | Notes |
   | ------ | ---- | ---- | ----- | ------- | ----- |
   | main() | 12   | a    | ?     | 1024    |       |
   |        |      | y    | ?     | 1028    |       |
   |        |      | mog  | ?     | 1032    |       |
   |        |      | x    | ?     | 1036    |       |

   since a, y and mog are int, the address-spaces differ by 4 bytes(32 bits, default size of int)

   the above table means that *before line 12 is executed, this is the state*

6. | method | line | var  | value | Address | Notes           |
   | ------ | ---- | ---- | ----- | ------- | --------------- |
   | main() | 13   | a    | 7     | 1024    |                 |
   |        |      | y    | 17    | 1028    |                 |
   |        |      | mog  | ?     | 1032    |                 |
   |        |      | x    | ?     | 1036    | double variable |

   control is now suspended from main(), and handed over to the function `mogrify()`, which is represented as an additional **stack frame** to the existing stack.

7. | method      | line | var  | value | Address | Notes           |
   | ----------- | ---- | ---- | ----- | ------- | --------------- |
   | main()      | 13   | a    | 7     | 1024    |                 |
   |             |      | y    | 17    | 1028    |                 |
   |             |      | mog  | ?     | 1032    |                 |
   |             |      | x    | ?     | 1036    | double variable |
   | `mogrify()` | 4    | a    | 7     | 1044    |                 |
   |             |      | b    | 17    | 1048    |                 |
   |             |      | tmp  | ?     | 1052    |                 |

   since x is a double variable, it takes up **64 bits/8 bytes**, hence the address of function parameter `a`(different from *local variable a* for the function `main()` )

   **Note**:  There may be a small amount of additional space required to deal with return values or register saves at the low level, hence practically the address for the stack frame of `mogrify()` **wont start immediately at 1044**, but at some later address.

8. | method      | line | var  | value | Address | Notes           |
   | ----------- | ---- | ---- | ----- | ------- | --------------- |
   | main()      | 13   | a    | 7     | 1024    |                 |
   |             |      | y    | 17    | 1028    |                 |
   |             |      | mog  | ?     | 1032    |                 |
   |             |      | x    | ?     | 1036    | double variable |
   | `mogrify()` | 5    | a    | 7     | 1044    |                 |
   |             |      | b    | 17    | 1048    |                 |
   |             |      | tmp  | 23    | 1052    |                 |

9. | method | line | var  | value | Address | Notes           |
   | ------ | ---- | ---- | ----- | ------- | --------------- |
   | main() | 13   | a    | 7     | 1024    |                 |
   |        |      | y    | 17    | 1028    |                 |
   |        |      | mog  | 23    | 1032    |                 |
   |        |      | x    | ?     | 1036    | double variable |

   `mogrify()` returns, hence its stack frame is removed, and since its return value was fed to `mog`, this variable is also now initialised.

   this corresponds to execution of line number 5 in `mogrify()`

10. | method | line | var  | value | Address | Notes           |
    | ------ | ---- | ---- | ----- | ------- | --------------- |
    | main() | 14   | a    | 7     | 1024    |                 |
    |        |      | y    | 17    | 1028    |                 |
    |        |      | mog  | 23    | 1032    |                 |
    |        |      | x    | ?     | 1036    | double variable |

11. printf() function call will take place now

    | method   | line         | var  | value                         | Address | Notes           |
    | -------- | ------------ | ---- | ----------------------------- | ------- | --------------- |
    | main()   | 14           | a    | 7                             | 1024    |                 |
    |          |              | y    | 17                            | 1028    |                 |
    |          |              | mog  | 23                            | 1032    |                 |
    |          |              | x    | ?                             | 1036    | double variable |
    | printf() | library-call | fmt  | ??                            | 1044    | 4-byte pointer  |
    |          |              | ??   | "Done with mogrify"(argument) | 1048    |                 |

12. | method       | line | var  | value | Address | Notes           |
    | ------------ | ---- | ---- | ----- | ------- | --------------- |
    | main()       | 16   | a    | 7     | 1024    |                 |
    |              |      | y    | 17    | 1028    |                 |
    |              |      | mog  | 23    | 1032    |                 |
    |              |      | x    | ?     | 1036    | double variable |
    | truly_half() | 8    | x    | 17    | 1040    |                 |
    |              |      | tmp  | ?     | 1044    | double variable |

13. | method       | line | var  | value | Address | Notes           |
    | ------------ | ---- | ---- | ----- | ------- | --------------- |
    | main()       | 16   | a    | 7     | 1024    |                 |
    |              |      | y    | 17    | 1028    |                 |
    |              |      | mog  | 23    | 1032    |                 |
    |              |      | x    | ?     | 1036    | double variable |
    | truly_half() | 9    | x    | 17    | 1040    |                 |
    |              |      | tmp  | 8.5   | 1044    | double variable |

14. now the function call to `truly_half()` will return, thus popping out its stack frame and the value returned will be assigned to x in main()

    | method | line | var  | value | Address | Notes           |
    | ------ | ---- | ---- | ----- | ------- | --------------- |
    | main() | 16   | a    | 7     | 1024    |                 |
    |        |      | y    | 17    | 1028    |                 |
    |        |      | mog  | 23    | 1032    |                 |
    |        |      | x    | 8.5   | 1036    | double variable |



* at the end, main is also a function which returns meaning its stack frame will be popped off and control will be returned to the mysterious and powerful C runtime system which is responsible for setting up main to run in the first place.
* The integer return value from main is passed back to whatever entity ran the program in the first place. Unix refers to this value as the exit status of a program. 
  * The unix convention is that a 0 exit status indicates everything went normally for the program while a non-zero return corresponds in some way to an error that occurred. 
  * Shell programs can access the return codes of programs to detect, for instance, that gcc did not succeed in compiling some code or that the search program grep did not find anything matching search terms.



# Stack overflow<a name="stackoverflow"></a>

When a program attempts to use more space than is available on the call stack (that is, when it attempts to access memory beyond the call stack's bounds, which is essentially a [buffer overflow](https://en.wikipedia.org/wiki/Buffer_overflow)), the stack is said to *overflow*, typically resulting in a program crash.

Probable Causes:

1. either the number of stack frames is too high, or the memory requirement for each stack frame is too large
2. hence in cases of infinite recursion/very deep recursion
3. in cases of each recursive function call storing very big variables(memory intensive variables)