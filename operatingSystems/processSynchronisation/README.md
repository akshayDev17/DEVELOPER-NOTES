# Table of Contents

1. [Race condition](#race-condition)
2. [Critical Section Problem](#csp)





# Race condition<a name="race-condition"></a>

* when multiple processes want to access a non-shareable resource, to decide which process will first get to do so is basically what is meant by process synchronisation
  * synchronised way of accessing non-shareable resources.
  * for instance, the bus that carries 0's and 1's signal along the ethernet connection is carrying a variety of data, say if someone is accessing facebook.com and at the same time downloading some movie, to organise the exchange of these bits from requesting client to server and back is a *real-time example of process synchronisation*
  * in the above example *the ethernet wires act as the non-shareable resource, behind creation of the ace condition*
* suppose variable: `a` is non-shareable resource, process P1 = `read(a); a+=1;write(a);` and process P2 = `read(a); a -= 1;write(a);`
  * let a = 10 initially, if P1 occurs completely, followed by P2, or vice-versa, we are left at the end with `a=10`
  * but if P1 occurs till `a+=1`, such that the local stack of P1 has `a = 11`, but then a sudden context switch is made to P2, and it is executed entirely, thus making `a=9`, after which the control is returned back to P1, **which writes `a` back as 11, since in its local stack it had a = 11.**
  * this is an example of **race condition(order of execution of processes change the main result)** and the **part of process that accesses such shared resources ** is called **critical section**
  * hence , in this case, the entire process codes represented full-blown critical sections.





# Critical Section Problem<a name="csp"></a>

1. the instructions-set of a process during which it wants to access shared resource(s)
2. a solution to this problem should satisfy 3 main criteria
   1. mutual exclusion
      1. CS to be accessed in ME fashion
      2. **mandatory criteria**
   2. progress
      1. consider only those process who **actually want to enter into their own CS**
      2. hence, running a pool of processes in round-robin fashion **does not satisfy this** since not all processes in this pool actually want to access their CS.
      3. **mandatory criteria**
   3. bounded wait
      1. maximum bound on the waiting time of a process that is waiting to enter into critical section
      2. 
      3. *optional criteria*