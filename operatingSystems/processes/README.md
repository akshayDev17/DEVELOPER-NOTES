# Table of Contents

1. [Process State](#process-state)
2. [Process Control Block](#pcb)
3. [Context Switch](#context-switch)
4. [Process Creation](#process-creation)
5. [Process Termination](#process-termination)
6. [Inter-process Communication](#ipc)





* process = program in execution, when its idle, its not usually referred to as a process.



# Process State<a name="process-state"></a>

1. defined by current activity of the process
2. new - process is being created
   running - instructions being executed
   waiting - waiting for an event to occur(I/O wait, reception of a signal)
   ready - waiting to be assigned to a processor(CPU wait)
   terminated - process has finished execution
3. <img src="processState.png" />
4. new--->ready (admitted), running--->end = exit.





# Process Control block<a name="pcb"></a>

1. also called **task** control block.
2. each process represented in the OS by this.
3. <img src="pcb.jpg" />
4. *Process ID* - id of the process, unique to each process.
5. *Process state* - tells the state(the 5 kinds discussed in the above section)
6. *Program Counter* - address of the next instruction to be executed for the current process
7. *CPU registers* - which of the index registers, stack pointer registers, general purpose registers, .... being used by a process.
8. *CPU scheduling information*
   1. priority of the process
   2. pointer to scheduling queue
   3. other scheduling parameters
9. *Memory management information* - different aspects of memory being used by the process
10. *Accounting information* - resources being used(what type and how many per type) by the process.
11. *I/O Status information* - I/O devices being assigned to the process for its execution.





# Context Switch<a name="context-switch"></a>

1. [interrupts](../preliminary/README.md/#interrupts) cause OS to change their current task and run a kernel routine
   1. such operations occur frequently on general purpose systems.
2. save the current context of the process that was currently running on the CPU, so that it can be restored after an interrupt has been processed, and the execution of this process can then be resumed.
   1. context = PCB of this process.
   2. this interrupt may lead to start of execution of a new/partially completed process, hence if its a partially completed process, its PCB also needs to be restored.
3. this state-save + possible-state-restore is called context-switch.
4. here the process being restored is the one that interrupts(or calls for the interrupt) the already running one.
5. time required for this is pure overhead, typical times = few milliseconds.



# Process Creation<a name="process-creation"></a>

1. a process itself may **create new processes**, via `createProcess()` syscall , during the course of its execution.
2. creator = parent, created = child/children processes.
3. a tree-like structure/hierarchy is now formed.
4. on creation of a child process,
   1. the parent may continue to execute concurrently with the child process.
   2. the parent waits until some/all children processes finish their execution.
5. w.r.t. the address space of a child process
   1. duplicate of parent, i.e. same program, data as parent
   2. new program loaded into it.







# Process Termination<a name="process-termination"></a>

1. after completing last execution, process asks for deletion, which is triggered using `exit()` syscall.
2. this process may return a status value to its parent process, if any, via the `wait()` syscall
   1. since the parent's execution may be dependent on how the child-process's execution finished.
3. all resources allocated to this process - I/O buffers, physical and virtual memory, open files, etc. de-allocated by OS.
4. a process may also call upon termination of some other process, via an apt syscall.(kill)
   1. usually such a syscall is/*can be* invoked by  the parent process only.
5. parent terminates child process
   1. child process exceeds allocated resources(parent has to inspect the resources being allocated to the child process)
   2. task is (no longer required)/completed.
6. parent is exiting, and OS doesn't allow a child process to continue, if its parent process terminates.







# Inter-process Communication<a name="ipc"></a>

1. concurrently executing processes in the OS - independent/cooperating
2. independent - can neither affect or get affected.
   cooperating - can affect or get affected, processes that **share data**.
3. reasons for process cooperation
   1. information sharing
   2. computation speedup - divide task into concurrent sub-tasks, rather than sequential execution, and now these sub-tasks(processes) may need to comms with each other.
   3. modularity - communication of modules with one another.
   4. convenience
4. IPC comms = shared memory(shared region of memory between cooperating processes, process read and write data to shared region) + message passing(comms by messages exchanged between cooperating processes).