Table of Contents

1. [Big O notation](#O)
2. [theta notation](#theta-notation)
3. [small o notation](o)
4. [&Omega; notation](#omega-notation)



# Big-O notation<a name="O"></a>

1. if a function f(n) = O(g(n)), it means that g(n) bounds the function f(n) from above
   1. there exists a value n0 and constant c, such that &forall; n &ge;n0, f(n) &le; c\*g(n), where c = constant of choice.
2. if we have 2 functions g1(n) and g2(n), such that its guaranteed &forall;n, n>0, g1(n) < g2(n) , then f(n) = O(g2(n))
   1. consider the scenario of insertion sort, best case = O(n), worst case = O(n^2), hence time complexity for insertion sort(**asymptotically**) = O(n^2)
3. asymptotic time complexity means time complexity at ![equation](https://latex.codecogs.com/gif.latex?%5Ctextrm%7Bn%7D%20%5Crightarrow%20%5Cinfty) , i.e. large inputs.
4. <img src="big-O.png" />
5. 



## Properties<a name="O-examples"></a>

1. constant multiplication
   1. if f(n) = c.g(n), then O(f(n)) = O(g(n))
2. polynomial function
   1. ![equation](https://latex.codecogs.com/gif.latex?f%28n%29%20%3D%20a_0%20&plus;%20a_1x%5E1%20&plus;%20a_2x%5E2.....a_mx%5Em%20%3B%20O%28f%28n%29%29%20%3D%20O%28n%5Em%29)
3. summation function
   1. ![equation](https://latex.codecogs.com/gif.latex?f%28n%29%20%3D%20f_1%28n%29%20&plus;%20f_2%28n%29%20&plus;%20f_3%28n%29....f_m%28n%29%2C%20f_i%28n%29%5Cle%20f_%7Bi&plus;1%7D%28n%29%2C%20O%28f%28n%29%29%20%3D%20O%28max%28f_i%28n%29%29%29)
4. logarithmic function
   1. ![equation](https://latex.codecogs.com/gif.latex?f%28n%29%20%3D%20log_bn%2C%20g%28n%29%20%3D%20log_an%2C%20O%28f%28n%29%29%20%3D%20O%28g%28n%29%29)
   2. all log functions grow in a similar fashion w.r.t. Big-O .



* A logarithmic algorithm – O(logn)
  * Runtime grows logarithmically in proportion to n.
* A linear algorithm – O(n)
  * Runtime grows directly in proportion to n.
* A superlinear algorithm – O(nlogn)
  * Runtime grows in proportion to n.
* A polynomial algorithm – O(n^c)
  * Runtime grows quicker than previous all based on n.
  * Strassen’s Matrix Multiplication.
* A exponential algorithm – O(c^n)
  * Runtime grows even faster than polynomial algorithm based on n.
  * Tower of Hanoi.
* A factorial algorithm – O(n!)
  * Runtime grows the fastest and becomes quickly unusable for even
    small values of n.
  * Determinant Expansion by Minors, Brute force Search algorithm for *Travelling Salesman Problem*.





## Examples<a name="O-examples"></a>



O(Log(Log(N)))

```c
// Here c is a constant greater than 1   
for (int i = 2; i <=n; i = pow(i, c)) { 
// some O(1) expressions
}
//Here fun is sqrt or cuberoot or any other constant root
for (int i = n; i > 1; i = fun(i)) { 
// some O(1) expressions
}
```



# Omega-notation(&Omega;)<a name="omega-notation"></a>

1. asymptotic lower bound
2. if f(n) = &Omega;(g(n)) , there exists a  constant c(**c > 0**), n0, such tha &forall; n > n0 , f(n) &ge; c.g(n)  
3. <img src="big-omega.png" />
4. 





# Theta-notation<a name="theta-notation"></a>

1. f(n) is said to be Θ(g(n)) if f(n) is O(g(n)) and f(n) is Ω(g(n))
2. <img src="big-theta.png" />



# small-o notation<a name="o"></a>





# Euclidean Algorithm for gcd<a name="gcd"></a>



## By Subtraction<a name="gcd-subtraction"></a>

```python
def gcd(a, b):
	if a == b:
		return a
	if a > b:
		gcd(a - b, b)
	else:
		gcd(a, b - a)
```

complexity = O(n), n = a+b



## By Division<a name="gcd-division"></a>

```python
def gcd(a, b):
    if a % b == 0:
        return b
    return gcd(b, a%b)
```

time complexity = O(log(n)) , n = a+b

proof is using fibonacci numbers

1. Denote by (ai, bi) pairs of values a and b, for which the above algorithm performs i steps. 
2. Then b_i &ge;  Fib_i−1 (where Fib_i is the i-th Fibonacci number). 
3. Inductive proof: 
   1. for one step, b1 = 0
   2. for two steps, b &ge; 1, 
   3. for more steps, (ak+1, bk+1) → (ak, bk) → (ak−1, bk−1), then ak = bk+1, ak−1 = bk, bk−1 = ak mod bk, so ak = q · bk + bk−1 for some q &ge; 1, so bk+1 &ge; bk + bk−1