# Table of Contents



# Introduction<a name="deadlock-intro"></a>

A process in operating systems uses different resources and uses resources in the following way. 
1) Requests a resource 
2) Use the resource 
2) Releases the resource 

**Deadlock**: situation where a set of processes are blocked because each process is holding a resource and waiting for another resource acquired by some other process. 



# Conditions for Deadlock<a name="deadlock-conditions"></a>

deadlock is bound to occur if the following 4 conditions occur at the **same time**:

1. Mutual Exclusion
   1. one or more resources cannot be shared
2. Hold and Wait
   1. process is holding atleast 1 resource and is waiting from some other.
3. No pre-emption
   1. resource cannot be taken from a process until it completes
4. circular wait
   1. set of processes are waiting for each other in a circular fashion



# Methods for Handling Deadlock<a name="deadlock=handling"></a>

1. Avoidance
   1. don't let the system arrive into a deadlock state
   2. if any 1 out of the above explained 4 conditions are not met, deadlock will never take place
   3. Banker's algorithm used
2. Deadlock detection and recovery
   1. Let deadlock occur, then do preemption to handle it once occurred.
3. Ignore the problem altogether: 
   1. If deadlock is very rare, then let it happen and reboot the system. 
   2. This is the approach that both Windows and UNIX take. 