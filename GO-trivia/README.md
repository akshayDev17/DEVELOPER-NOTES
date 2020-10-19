# Table of Contents

1. [History](#history)
2. [Why golang?](#why-golang)
3. [How is GO compiled?](#go-compilation)
   1. [Scanner](#GO-scanner)
   2. [Parser](#GO-parser)
   3. [Code generation](#Go-code-generation)
4. [Fundamentals](#go-fundamentals)
   1. [identifiers](#go-identifiers)
5. [Arrays in GO](#go-arrays)
   1. [definition](#go-array-def)
   2. [passage as function argument](#go-array-function-parameter)
6. [Pointers](#go-pointers)
   1. [Double pointer]()
   2. [Pointers as function arguments]()
   3. [Pointers to struct](#go-struct-pointers)
7. [Interfaces](#go-interfaces)





# History<a name="history"></a>

1. developed in 2007 by Robert Griesemer, Rob Pike and Ken Thompson at Google but launched in 2009 as an *open-source programming language*
2. supports environment adopting patterns alike to [dynamic languages](https://github.com/akshayDev17/DEVELOPER-NOTES/tree/master/programmingLanguagesTrivia#stdt). For eg., type inference (`y := 0` is a valid declaration of a variable `y` of type `float`, here the variable `y` doesn't need to be declared before being assigned a value, that's why its called environment adopting patterns).



* `Go` distribution comes as a binary installable.



# Why Golang?<a name="why-golang"></a>

* Because Go language is an effort to combine the ease of programming of an [interpreted, dynamically typed language](https://github.com/akshayDev17/DEVELOPER-NOTES/tree/master/programmingLanguagesTrivia#compiled-vs-interpreted-differences)(for instance python) with the efficiency and safety of a [statically typed, compiled language](https://github.com/akshayDev17/DEVELOPER-NOTES/tree/master/programmingLanguagesTrivia#compiled-vs-interpreted-differences)(for instance C/Java). 
* It also aims to be modern, with support for networked and multi-core computing.
* There are no forward declarations(declare the function , but don't define it) and no header files(unlike C/C++); everything is declared exactly once.
* There is no explicit type-hierarchy, i.e. no top-type is present, which , however *`interface{}`* is the **universal-base** class in Golang, which is a **compile-time static type**.
  * variables of type `interface` can accept any object value, but do not reflect real run time types that an object can have in the type system, so are not top types in the first regard(with regards to the existence of a universal-base class).



# How is Go compiled?<a name="go-compilation"></a>

3 phases of the compiler

1. The scanner, which converts the source code into a list of tokens, for use by the parser.
2. The parser, which converts the tokens into an Abstract Syntax Tree to be used by code generation.
3. The code generation, which converts the Abstract Syntax Tree to machine code.



![equation](https://latex.codecogs.com/gif.latex?%7B%5Ccolor%7BRed%7D%20%5Ctextrm%7BPlease%20read%7D%7D)[this](https://getstream.io/blog/how-a-go-program-compiles-down-to-machine-code/)



*The actual GO compiler doesn't use these packages, however its semantics are very similar to this sequence of events. It does not use these packages because the compiler was once written in C and converted to Go code, so the actual Go compiler is still reminiscent of that structure.*



## Scanner<a name="GO-scanner"></a>

* The first step of every compiler is to break up the raw source code text into tokens, which is done by the scanner (also known as lexer). 
* Tokens can be **keywords, strings, variable names, function names**, etc. 
* Every valid program *word* is represented by a token. 
* In concrete terms for Go, this might mean we have a token “package”, “main”, “func” and so forth. 
* Each token is represented by its position, type, and raw text in Go. 
* Go even allows us to execute the scanner ourselves in a Go program by using the **go/scanner** and **go/token** packages. 
* That means we can inspect what our program looks like to the Go compiler after it has been scanned.



## Parser<a name="GO-parser"></a>

* After the source code has been scanned, it will be passed to the parser. 
* The parser is a phase of the compiler that converts the tokens into an **Abstract Syntax Tree (AST)**. 
* The AST is a structured representation of the source code. 
* In the AST we will be able to see the program structure, such as functions and constant declarations. 
* Go has again provided us with packages to parse the program and view the AST: **go/parser** and **go/ast**.



## Code Generation<a name="Go-code-generation"></a>

* After the imports have been resolved and the types have been checked, we are certain the **program is valid Go code** and we can start the process of converting the **AST to (*pseudo*) machine code**. 
* The first step in this process is to convert the AST to a lower-level representation of the program, specifically into a Static Single Assignment (SSA) form. 
* This intermediate representation is not the final machine code, but it does represent the final machine code a lot more(can be thought of as the ByteCode seen in the [intermediate approach](https://github.com/akshayDev17/DEVELOPER-NOTES/tree/master/programmingLanguagesTrivia#ia), although no bytecode file is generated). 
* SSA has a set of properties that make it easier to apply optimizations, most important of which that a variable is always defined before it is used and each variable is assigned exactly once. 
* After the initial version of the SSA has been generated, a number of **optimization passes** will be **applied**. 
* These optimizations are applied to certain pieces of code that can be made simpler or faster for the processor to execute. 
  * For example, dead code, such as **`if (false) { fmt.Println(“test”) }`** can be eliminated because this will never execute. 
  * Another example of an optimization is that certain nil checks can be removed because the compiler can prove that these will never false.



### Features

1. **Package Management:** 
   1. Go merges modern day developer workflow of working with *Open Source projects* and includes that in the way it manages external packages. 
   2. Support is provided directly in the tooling to get external packages and publish your own packages in a set of easy commands.
2. **Static Typing**
   1. compiler not just works on compiling the code successfully but also ensures on type conversions and compatibility. 
   2. Because of this feature Go avoid all those problems which we face in dynamically typed languages.
   3. not mandatory, hence is a feature rather than being a disadvantage 
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





# Fundamentals<a name="go-fundamentals"></a>



# Identifiers<a name="go-identifiers"></a>

can be any of the following:

1. variable name
2. function name
3. package name
4. package type
5. constant
6. statement labels

Rules for defining **valid** identifiers:(otherwise compile-time error)

1. must begin with letter or '_'(**cannot** begin with a number)
2. intermediate letters may contain numbers, a-z or A-Z and '_'(apart from these, nothing else is allowed)
3. reserved keywords(int, string etc.) **cannot be used** as identifiers
4. no limit on the length of the name of the identifier



**Pre-declared identifiers**:

* constants: true, false, iota, nil(`err != nil`)
* types: int, int8, int16, int32, int64, uint,
  uint8, uint16, uint32, uint64, uintptr,
  float32, float64, complex128, complex64,
  bool, byte, rune, string, error
* functions
  * make
  * delete
  * len
  * cap
  * new
  * append
  * copy
  * close
  * complex
  * real
  * imag
  * panic
  * recover

The identifier which is allowed to access it from another package is known as the *exported identifier*. The exported identifiers are those identifiers which obey the following conditions:

- The first character of the exported identifier’s name should be in the Unicode upper case letter.
- The identifier should be declared in the package block, or it is a variable name, or it is a method name.



# Arrays in GO<a name="go-arrays"></a>

### Array definition<a name="go-array-def"></a>

```go
var arrayName[30]int
// var arrayName[length]type

arr := [3][3]string{{"C#", "C", "Python"},  
                   {"Java", "Scala", "Perl"}, 
                    {"C++", "Go", "HTML"},} 

// Creating an array whose size is determined  
// by the number of elements present in it 
// Using ellipsis 
myarray:= [...]string{"GFG", "gfg", "geeks", 
                    "GeeksforGeeks", "GEEK"} 

// copy-by-reference
myArray2 := &myarray
// here, if myArray2 is mutated, the change is reflected in myarray
```

* arrays are mutable, but size remains the same
* In an array, if an array does not initialized explicitly, then the **default value of this array is 0**
* In Go language, **an array is of value type not of reference type**. 
  * So when the array is assigned to a new variable, then the changes made in the new variable do not affect the original array.
  * this is unlike a `numpy array` in `python`
* can be compared using `==` , alike python 



## Passage into a function<a name="go-array-function-parameter"></a>

```go
// For sized array
func function_name(variable_name [size]type){
// Code
}

// For unsized array
func function_name(variable_name []type){
// Code
}
```





# Pointers<a name="go-pointers"></a>

total time : 1:26:16

```go
var ptrName *int; // set to nil

// initialisation
var a = 45
var s *int = &a
```



* null pointer actual value is `nil`

* default(*uninitialised*) pointer is always set to `nil`

* if the datatype to which a pointer variable will be pointing to is specified, then in the future it can be only assigned to pointing the same types of variables(pointers aren't dynamic type)

  * to overcome this:

    ```go
    var y = 456 // y := 456
    var x = &y // x becomes a pointer to y , x := &y
    ```

  * here, the compiler is the one who determines the type of this pointer variable

* ```go
  var x = 200;
  var p *int = &x
  fmt.Println(x)// 200
  
  // pointer magic
  *p = 500
  fmt.Println(x)// 500
  ```

* if ptr1 and ptr2 point to same variable ptr1 == ptr2 is true

* `cap(ptr)` and `len(ptr)` returns the **capacity** and length respectively of a pointer, both are integer values, this is **defined only for pointer to array** type pointers

  ```go
  var ptr1 [7]*int // cap(ptr1) = 7
  var ptr2 [5]*string // cap(ptr2) = 5
  var ptr3 [8]*float64 // cap(ptr3) = 8
  
  
  ```



## Double pointers in go<a name="go-double-pointers"></a>

* pointer to a pointer

* ```go
  // taking a variable // of integer type 
  var V int = 100 
  
  // taking a pointer of integer type  
  var pt1 *int = &V 
  fmt.Println(pt1) // address of V
  
  // taking pointer to pointer to pt1 storing the address of pt1 into pt2 
  var pt2 **int = &pt1
  fmt.Println(pt2) // address of pt1
  fmt.Println(*pt2) // address of V i.e. value of pt1
  ```





## Pointers as function-argument<a name="go-func-pointer"></a>

```go
package main 
import "fmt"
func ptf(a *int) { 
    *a = 748 // dereferencing, *a := 748 can also be used, but a non-int cannnot be assigned
}
func rptr
func main() {   
    var x = 100 
    fmt.Printf("The value of x before function call is: %d\n", x) // 100
    var pa *int = &x 
    ptf(pa)
    fmt.Printf("The value of x after function call is: %d\n", x) // 748  
} 
```



* to avoid issues like [allocating functional-scopic variables onto stack](https://github.com/akshayDev17/DEVELOPER-NOTES/tree/master/c-trivia#functional-scope), GO compiler allocates variables on the heap

* it then performs escape analysis to escape the variable from the local scope.

  ```go
  package main   
  import "fmt"
  func main() {
      n := rpf()
      fmt.Println("value of n is, ", n) // 0xc000098010
      fmt.Println("Value of n is: ", *n) // successfully prints 100
  }
  func rpf() *int {
      lv := 100
      fmt.Println("value of lv is, ", lv) // 100
  	fmt.Println("value of address of lv is, ", &lv) // 0xc000098010
      return &lv
  }
  ```

  ![equation](https://latex.codecogs.com/gif.latex?%7B%5Ccolor%7BRed%7D%20%5Ctextrm%7BNote%3A%7D%7D) *Golang doesn’t provide any support for the pointer arithmetic like C/C++. If performed, the compiler will throw an error as invalid operation.*





```go
package main 
import "fmt"
func updatearray(funarr *[5]int) { // update(funarr []int) 
    (*funarr)[4] = 750 // funarr[4] = 750 does the same    
} 
func main() { 
    arr := [5]int{78, 89, 45, 56, 14}   
    // passing pointer to an array(by reference) to function
    updatearray(&arr) // good practice => update(arr[:]) , usage of slice
    fmt.Println(arr) 
} 
```

**Note:** 

* In Golang it is not recommended to use Pointer to an Array as an Argument to Function as the code become difficult to read. 
* Also, it is not considered a good way to achieve this concept. 
* To achieve this you can use **slice** instead of passing pointers.





## GO struct pointers<a name="go-struct-pointers"></a>

```go
ptr := &structVarName
fmt.println(ptr) // &{fieldVal1 fieldVal2 ...}
fmt.Println(ptr.fieldName == (*ptr).fieldName) // true
ptr.fieldNameX = newValX // modify fields
```







# Interfaces<a name="go-interfaces"></a>

**36:52**

1. specify a set of method signatures(declaring the method name, return type, but not writing the function body is called method signature.)

2. this itself is abstract, hence cannot create an instance of interface

   1. in JAVA, once a class implements an interface, an instance of that class(an object of that class) can be created, thereby creating an instance of this interface
   2. this cannot be done in GO, since there are no classes in GO, hence nothing implements an interface.
   3. but allowed to create a variable of type `interface` and assign it to a concrete type that has the functions of the interface defined(the methods declared in the interface have been defined for this variable)
   4. in GO, it is necessary to implement all methods declared in a 

3. ```go
   type geometry interface {
       area() float64
       perim() float64
   }
   type rect struct {
       width, height float64
   }
   type circle struct {
       radius float64
   }
   func (r rect) area() float64 { // interface methods
       return r.width * r.height // implemented for rect struct
   }
   func (r rect) perim() float64 {
       return 2*r.width + 2*r.height
   }
   func (c circle) area() float64 { // interface methods
       return math.Pi * c.radius * c.radius // implemented for circle struct
   }
   func (c circle) perim() float64 {
       return 2 * math.Pi * c.radius
   }
   func measure(g geometry) {
       fmt.Println(g)
       fmt.Println(g.area())
       fmt.Println(g.perim())
   }
   func main() {
       r := rect{width: 3, height: 4}
       c := circle{radius: 5}
   
       measure(r)
       measure(c)
   }
   ```

4. empty interface: `interface{}`, all types implement the empty interface.

5. interfaces are of 2 types - static and dynamic.

   1. interface does not have a static **value**(different from type), hence in the example below, type = static(nothing implements the interface), value = dynamic

   2. ```go
      type tank interface {
          Tarea() float64 
          Volume() float64 
      } 
      func main() { 
          var t tank // tank = interface, t - variable of type tank
          fmt.Println("Value of the tank interface is: ", t) // <nil> this is printLN
          fmt.Printf("Type of the tank interface is: %T ", t) // <nil> // this is printF
          
          y := 456
      	fmt.Println("The value of y is ", y) // 456
      	fmt.Printf("Its type is %T\n", y) // int
      }
      
      // errorneous code:
      func (x int) Tarea() float64 {
      	return float64(x) / 4.0
      }
      ```

   3. interface type = dynamic, interface value = dynamic when the variable is of a datatype that implements the interface

      ```go
      type tank interface {
      	Tarea() float64
      }
      type panzer struct {
      	radius float64
      	height float64
      }
      func (p panzer) Tarea() float64 { // panzer implements the interface and defines its method
      	return math.Pi * math.Pow(p.radius, 2) * p.height
      }
      func main() {
      	p := panzer{radius: 3, height: 5}
      	fmt.Println("The value of p Tarea is ", p.Tarea()) // execute and find value
      	fmt.Printf("Its type is %T\n", p.Tarea()) // float64
      }
      ```

      

   4. the erroneous code returns a compile time error: *cannot define new methods for non-local type int*

      1. this is because int is already a pre-defined datatype(also a keyword) in GO
      2. for such data-types, writing additional methods in this way is wrong.
      
   5. **Type Assertions:**
   
      1. check dynamic type of the variable
   
      2. if T = concrete type(a pre-defined data-type or a struct that may or may not implement method(s) of an interface), type assertion checks whether the dynamic type of a is equal to T
   
         1. if successful, assertion returns the dynamic value of a
            1. if types are equal, then the value is returned
            2. else the default value is returned,  with another boolean variable = false(ok)
         2. else, panics
   
      3. T = interface type, the given dynamic type of a is checked with T
   
         1. if **successful, does not** return the dynamic value of a.
   
      4. ```go
         func myfun(a interface{}) {
         	val := a.(string)
         	fmt.Println("Value: ", val) // "GeeksfoGeeks"
         
         	val_1, ok := a.(int) // separate variable va_1 has to be used
         	if !ok {   		  // since the val is of type string and cannot be type-casted into an int, the ok is a bool type
         		fmt.Println(err, "\n", val_1) // false, 0 is printed
         	}
             
             val_2, ok_2 := a.(interface{})
         	if !ok_2 {
         		fmt.Println("value is ", val_2, " with return ", ok_2) // this is printed
         	} else {
         		fmt.Println("value is ", val_2, " with return ", ok_2)
         	}
             x := 456
         	val_2, ok_2 = x.(interface{}) // invalid type assertion error, program panics
         }
         func main() {
         	var val interface {
         	} = "GeeksforGeeks"
         	myfun(val)
         }
         ```





# Interview Questions



