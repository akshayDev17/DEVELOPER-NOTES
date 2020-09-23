# Table of Contents

1. [Horizontal vs Vertical Scalability](#scalability)
   1. [Vertical Scalability](#vs)
   2. [Horizontal Scalability](#hs)





# Horizontal vs Vertical Scalability<a name="scalability"></a>

## Vertical Scalability<a name="vs"></a>

1. adding more resources (CPU/RAM/DISK) to your server (database or application server still remains one) on demand.
2. most commonly used in applications and products of middle-range as well as small and middle-sized companies. 
3. One of the most common examples is to buy an expensive hardware and use it as a Virtual Machine hypervisor (VMWare ESX).
4. usually means upgrade of server hardware. 
5. Some of the reasons to scale vertically includes increasing IOPS (Input / Output Operations), amplifying CPU/RAM capacity, as well as disk capacity.
6. However, even after using virtualisation, whenever an improved performance is targeted, the risk for down-times with it is much higher than using horizontal scaling.

## Horizontal scalability<a name="hs"></a>

1. means that higher availability of services required, adding more processing units or physical machines to your server/database
2. growing the number of nodes in the cluster
3. reducing the responsibilities of each member node by spreading the key space wider and providing additional end-points for client connections. 
4. Horizontal Scaling has been historically much more used for high level of computing and for application and services.
5. **Although this does not alter the capacity of each individual node**, the load is decreased due to the distribution between separate server nodes.
6. the reason organisations prefer this largely over *<u>vertical scalability</u>* is because of increasing I/O concurrency, reducing the load on existing nodes, and increasing disk capacity can be achieved with it.