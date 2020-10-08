## Usual sizes of data-types

1. int, pointer(any pointer, since pointer stored address, which is a 32 bit number), float - 4Bytes
2. char - 1 byte



`continue` means that further statements in the loop won't be read:

1. in the case of the `for` loop, i.e.

   ```c
   for(int i = 0;i<10;i++){
       continue;
       printf("%d\n", i*i);
   }
   ```

   * the `printf` statement won't work, since after hitting continue, for the **for loop**, causes its loop expression to be evaluated.
   * the conditional expression is then re-evaluated
   * but this is still a finite loop, since the body of the for-loop is executed, which contains the increment statement.

2. in the case of the `while` or `do while` loop, i.e.

   ```c
   int i = 0;
   while(i < 10){
       continue;
       printf("%d\n", i*i);
       i++;
   }
   ```

   * the `printf` statement won't work, since after hitting continue, for the **while loop**, causes its loop expression to be evaluated.
   * Within a **`do`** or a **`while`** statement, the next iteration starts by re-evaluating the expression of the **`do`** or **`while`** statement, i.e. the if-condition.
   * since the increment is after the continue statement, even this step will be skipped, thus making these 2 loops as infinite loops.
   * for **`do-while`**  loops, notice that the conditional expression appears at the end of the loop, so the statement(s) in the loop executes once before the condition is tested.



# Pointers in C<a name="c-pointers"></a>

```c
int main() 
{ 
  void demo(); 
  void (*fun)(/*provide arguments-datatypes for the function that this function-pointer is gonna point to */);
   /*lets say that this pointer instead pointed to a function: void printOut(int a){printf("%d\n", a);}
  then the declaration of this pointer should have been 
  void (*fun) (int);
  */
  fun = demo; 
  (*fun)(); 
  fun(); 
  return 0; 
} 
 
void demo() 
{ 
  printf("GeeksQuiz "); 
} 
```

* this will print "GeeksQuiz GeeksQuiz "
* demo() is declared at line number x in main(), and then defined at line number y
* hence calling it is not a problem
* fun is a pointer to a void function
  * Unlike normal pointers, a function pointer points to code, not data. 
  * Typically a function pointer stores the start of executable code.
  * Unlike normal pointers, we do not allocate de-allocate memory using function pointers.(*no malloc/calloc required*).
  * A function’s name can also be used to get functions’ address. For example, in the above program,  the address operator ‘&’ is removed in assignment. Also while assigning `fun` to the function `demo`, its \* operator is also dropped. 
* *fun() means call the function pointed to by fun, i.e. `demo`



```c
// A simple C program to show function pointers as parameter 
#include <stdio.h> 
  
// Two simple functions 
void fun1() { printf("Fun1\n"); } 
void fun2() { printf("Fun2\n"); } 
  
// A function that receives a simple function 
// as parameter and calls the function 
void wrapper(void (*fun)()) 
{ 
    fun(); 
} 
  
int main() 
{ 
    wrapper(fun1); 
    wrapper(fun2); 
    return 0; 
}
```

* since the statement `void *f() = fun;` is valid, it should be obvious that a function itself can be passed as an argument, if the function-pointer is the actual parameter.




```c
#include "stdio.h"  
int main() 
{ 
 void *pVoid; 
 pVoid = (void*)0; 
 printf("%lu",sizeof(pVoid)); 
 return 0; 
} 
```

* An absolute address can be assigned to any pointer though it might result in issues at run time if the address is illegal.
* here pVoid is being assigned to address 0, which is a legal address
  * this statement would have caused a runtime error if this 0 was replaced with something that represents **an illegal address**.
  * (void *)0 is basically <u>NULL pointer</u>
  * de-referencing operations such as `*pVoid` or anything to do with `*pVoid`will result in a runtime error



* ```c
  #include "stdlib.h" 
  int main() 
  { 
   int *pInt; 
   int **ppInt1; 
   int **ppInt2; 
    
   pInt = (int*)malloc(sizeof(int)); 
   ppInt1 = (int**)malloc(10*sizeof(int*)); 
   ppInt2 = (int**)malloc(10*sizeof(int*)); 
    
   free(pInt); 
   free(ppInt1); 
   free(*ppInt2); 
   return 0; 
  } 
  ```

  * in this , all lines are correct, i.e. no compile/run-time error will be present.
  * as long as a pointer a passed inside **`free`** method, it is going to be syntactically correct.



```c++
// C++ program to return the 
// pointer from a function 
#include <iostream> 
using namespace std; 
  
// taking a function having 
// pointer as return type 
int* rpf(int); 
  
int main() 
{ 
  
    int n = 745; 
  
    // displaying the value of n 
    cout << n << endl; 
  
    // calling the function 
    cout << *rpf(n) << endl; 
} 
  
// defining function 
int* rpf(int n1) 
{ 
  
    // taking a local variable 
    // inside the function 
    int lv = n1 * n1; 
  
    // make the above 
    // declaration as static which 
    // result into successful 
    // compilation 
    // static int lv = n1 * n1; 
  
    // this will give warning as we 
    // are returning the address of 
    // the local variable 
    return &lv; 
} 
```



* this code gives a warning:
  *prog.cpp: In function ‘int\* rpf(int)’:*
  *prog.cpp:24:9: warning: address of local variable ‘lv’ returned [-Wreturn-local-addr]*
  *int lv = n1 \* n1;*
* compiler always make a stack for a function call. 
* As soon as the function exits the function stack also get removed which causes the local variables of functions to go out of scope. 
* Making it(local variable **lv**) static will resolve the problem as static variables have a property of **preserving** their **value even after** they are **out of their scope**.





# Variable-names in C<a name="variables-c"></a>

1.  In C language, a variable name can consists of letters, digits and underscore i.e. _ .
2. But a variable name has to start with either letter or underscore. 
3. It can’t start with a digit.
4. hence, ak, _ak, _ak_2019, _192_ak are all valid, but **1923_ak** is invalid