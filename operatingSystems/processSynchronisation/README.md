# Table of Contents

1. [Race condition](#race-condition)
2. [Critical Section Problem](#csp)
3. [Using turn variable to solve CSP](#turn-CSP)
4. [Using flag variable to solve CSP](#flag-CSP)





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



# Turn variable to solve CSP<a name="turn-CSP"></a>

1. ```cpp
   // turn is a global variable across processes
   turn = 0;
   
   // p0
   while(1){
       while(turn!=0);
       // cs
       turn = 1;
       // remainder section = rs
   }
   
   // p1
   while(1){
       while(turn!=1);
       // cs
       turn = 0;
       // remainder section = rs
   }
   ```

2. `while();` means a trap, i.e. an infinite loop

   1. hence, if a CPU does context switch to this section of the process, the process will use up its time quantum doing absolutely nothing(trapped in this while loop), and then context switch will happen away from this process.

3. at the start, since `turn=0`, `p0` enters it CS

   1. suppose being amidst its CS, CPU is preempted from P0 and given to P1
   2. still P1 will fall into the trap(`turn == 0`,hence `turn!=1`), and after its time-quantum expiration, the CPU will be given back to ready-state processes, i.e P0

4. P0 will complete its CS, and thus change `turn=1`

   1. now, if P0 wants to enter into CS again, as soon as `turn` is modified, it can't, as it will fall in its trap
   2. now if control is preempted to P1, P1 can easily enter CS since `turn==1`

5. for more than 2 processes, when `turn = index-of-process(id)` only then that process is allowed to enter into its CS.

6. this solution **satisfies mutual exclusion property** for a candidate solution for a CSP.

7. here, a cyclic trend is created

   1. for only 2 processes P0 and P1, only after P0 has accessed its CS is P1 even allowed to do the same, and only after P1 has accessed its CS can P0 **again** access its CS.
   2. this **does not follow a progress criteria**, since it may so happen that P0 may not want to enter into its CS, thus barring P1 to do the same.
   3. this solution **imposes strict alternation**.

8. even for more than 2 processes, suppose just after the CS code, `turn = random({set of pids}-current_pid)` actually will force the process with pid = turn to go through its CS, even if it doesn't want to, so that some other process may get a chance later.





# Flag variable to solve CSP<a name="flag-CSP"></a>

1. in the **turn variable solution** it was never asked to a process, whether it wants to enter into its CS.

2. ```cpp
   // turn is a global variable across processes
   flag = {false, false};
   
   // p0
   while(1){
       flag[0] = true;
       while(flag[1]);
       // cs
       flag[0] = false;
       // remainder section = rs
   }
   
   // p1
   while(1){
       flag[1] = true;
       while(flag[0]);
       // cs
       flag[1] = false;
       // remainder section = rs
   }
   ```

3. `flag[i] = true` signifies whether process-i wants to enter into its CS.

4. suppose P0 wants to enter into its CS first

   1. it makes `flag = {true, false}`, followed by trap, in which P0 doesn't fall since the flag-array keeps the information that P1 doesn't want to enter into its CS
   2. P0 carries out with its own CS execution
   3. then `flag = {false, false}`, and now if P1 wants it can easily enter into its CS.

5. hence the *cyclic dependency* is broken, which was observed in turn-variable solution.

6. this solution **ensures mutual exclusion** as no 2 processes can actually access their own CS at the same time.

7. suppose P1 wants to enter into its CS first

   1. it makes `flag = {false, true};` then enters and exits the trap, easily executes its CS and makes `flag = {false, false}`
   2. if suppose P1 was preempted after `flag = {false, true};`, to P0, after its first line, `flag = {true, true}`
   3. now if the next line of P0 is executed, P0 falls into a trap, and after its time-quantum expiration the control is preempted back to P1 and it will also fall into a trap.
   4. thus **deadlock occurs** in this solution
   5. this is because of **trying to achieve progress criteria**

8. hence **progress** is also **not satisfied**