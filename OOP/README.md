# Table of Contents

1. [Inheritance, Encapsulation, polymorphism, abstract class, interface](https://github.com/akshayDev17/java-material/tree/master/oop)
2. [Serialization](#serialization)
   1. [Uses](#serialization-usage)
   2. [downsides](#serialization-downsides)
3. [Overloading](#overloading)
   1. [Method](#method)
   2. [Operator](#operator)
4. [Overriding](#overriding)





# Serialization<a name="oop-serialization"></a>

* changing the object state to a **series of bits**
* changing the object to a format that can be transmitted/stored
* object could be reconstructed later, by **deserializing** it
* also called **marshaling**, and deserialization - **unmarshaling**
* the object is referred to as archive, after being serialized.
* Serialization is a low-level technique that violates encapsulation and breaks the opacity of an abstract data type.
* usually, the object in a program is stored in main-memory(addresses of fields and all), hence in a program its easily accessible, but what about if we want to store this object, mostly in a file
  * for instance, a neural net having some model parameters, biases, weights , and we need to store these weights and biases into a file
  * we use the `pickle` module in python , for example, to save a model, here serialization of the neural-net object is actually taking place.
* for an object, since an explicit relation between its field does not exist, a hierarchy has to be created by tracing all the dependencies
  * cdcd
* used while deep-copying a dataStructure as well

## Uses of serialization<a name="serialization-usage"></a>

- A method of transferring data through the wires (messaging).
- A method of storing data (in databases, on hard disk drives).
- A method of [remote procedure calls](https://en.wikipedia.org/wiki/Remote_procedure_call), e.g., as in [SOAP](https://en.wikipedia.org/wiki/SOAP).
- A method for distributing objects, especially in [component-based software engineering](https://en.wikipedia.org/wiki/Component-based_software_engineering) such as [COM](https://en.wikipedia.org/wiki/Component_Object_Model), [CORBA](https://en.wikipedia.org/wiki/CORBA), etc.
- A method for detecting changes in time-varying data.





There is no support for more advanced constructions like pointers, references, variants, collections and objects. 

Developers are required to rely on additional libraries or to manually write serialization code.



## Downsides to serialization<a name="serialization-downsides"></a>

1. Serialization breaks the opacity of an [abstract data type](https://en.wikipedia.org/wiki/Abstract_data_type) by potentially exposing private implementation details. 
   1. Trivial implementations which serialize all data members may violate encapsulation.
   2. To discourage competitors from making compatible products, publishers of proprietary software often keep the details of their programs' serialization formats a trade secret. 
   3. Some deliberately obfuscate or even encrypt the serialized data. 
   4. Yet, inter-operability requires that applications be able to understand each other's serialization formats. 
   5. Therefore, [remote method call](https://en.wikipedia.org/wiki/RMI-IIOP) architectures such as [CORBA](https://en.wikipedia.org/wiki/CORBA) define their serialization formats in detail.
   6. Many institutions, such as archives and libraries, attempt to [future proof](https://en.wikipedia.org/wiki/Future_proof)(anticipate and minimize shocks to the system in future ) their backup archives—in particular, database dumps - by storing them in some relatively human-readable serialized format.





# Friend Class<a name="friend-class"></a>

1. can access private and protected members of another class, in which it is declared as a friend.

2. ```cpp
   class Node { 
   private: 
       int key; 
       Node* next; 
       /* Other members of Node Class */
     
       // Now class  LinkedList can 
       // access private members of Node 
       friend class LinkedList; 
   };
   ```

   1. here, the Node class declares `LinkedList` class as a friend class, so that an instance of `LinkedList` can access private methods of `Node`

3. ```cpp
   class A1{
   private:
   	int a;
   public:
   	A1(){a = 120;}
   	friend class A11;
   };
   
   class A11{
   private:
   	int b;
   public:
   	A11(){
   		b=321;
   	}
   	void showA1(A1 &x){
   		// passing an instance of a class itself as an argument
   		cout << "A1.a = " << x.a << endl;
   	}
   };
   
   int main()
   {
   	A1 a1;
   	A11 a11;
   	a11.showA1(a1); // A1.a = 120
   	return 0;
   }
   ```









# Friend-Function<a name="friend-function"></a>

1. just like a friend-class, a method/**function** that has access to private and protected members of another class, that declares this function as a friend-function.

2. ```cpp
   class Node { 
   private: 
       int key; 
       Node* next; 
     
       /* Other members of Node Class */
       friend int LinkedList::search(); 
       // Only search() of linkedList 
       // can access internal members 
   };
   ```

3. this means that **an instance of `LinkedList`**, using the method **`search`** can access private/protected parameters of a `Node` instance, **but not the other way around**

   1. neither can an instance of `Node` access its own private/protected fields.

4. **global friend-function**

   ```cpp
   class A { 
       int a; 
     
   public: 
       A() { a = 0; } 
     
       // global friend function 
       friend void showA(A&); 
   }; 
     
   void showA(A& x) 
   { 
       // Since showA() is a friend, it can access 
       // private members of A 
       std::cout << "A::a=" << x.a; 
   }
   ```

   1. this **is to be** called **without** creating an instance of a class, i.e. we need to do write `A a1;showA(a1);` to call this global friend function, 
      **`a1.showA(a1)`** will actually throw an error: **`error: ‘class A’ has no member named ‘showA’`**

5. 











* Friends should be used only for limited purpose. 

  * **too many** functions or external classes are declared as **friends** of a class with protected or private data, it **lessens** the value of **encapsulation** of separate classes in object-oriented programming.

* Friendship is not mutual. 

  * If class A is a friend of B, then B doesn’t become a friend of A automatically.

  * ```cpp
    class A1{
    private:
    	int a;
    public:
    	A1(){a = 120;}
    	friend class A11;
    	class A11{
    	private:
    		int b;
    	public:
    		A11(){
    			b=321;
    		}
    		void showA1(A1 &x){
    			// passing an instance of a class itself as an argument
    			cout << "A1.a = " << x.a << endl;
    		}
    	};
    	void showA11(A11 &a11){
    		cout << "A11.b = " << a11.b << endl;
    	}
    };
    ```

  * simply executing this gives us the error:

    ```bash
    trial.cpp:12:7: error: ‘int A1::A11::b’ is private
       int b;
    ```

* Friendship is not inherited (See [this ](https://www.geeksforgeeks.org/g-fact-34/)for more details)

  * **No-inheritance of Friend-class**

    ```cpp
    // add this to the above code
    class A1child : public A1{
    };
    int main(){
        A1child a1child;
    	a1child.showA1(a1); // gives a compile-time error, saying that THERE IS NO MEMBER FUNCTION IN A1child
    	return 0;
    }
    ```

  * **no inheritance of friend-function**

    ```cpp
    class A 
    { 
    private: 
    	int x; 
    public: 
    	A() { x = 0;} 
    	friend void show(); 
    }; 
    
    class B: public A 
    { 
    public: 
    	B() : y (0) {} 
    private: 
    	int y; 
    
    }; 
    
    void show() 
    { 
    	A a1;
    	cout << a1.x << endl;
    
    	B b; 
    	cout << "The default value of A::x = " << b.x; 
    
    	// Can't access private member declared in class 'B' 
    	cout << "The default value of B::y = " << b.y; 
    } 
    ```

    `show()` is to be called from main-function, here both A and B instances can access private x, but B cannot access its own private variable y, since it does not inherit `show()` in the way that makes it able to access its own private variables.













# Use of final keyword<a name="final"></a>

final specifier in C++ 11 can also be used to prevent inheritance of class / struct. If a class or struct is marked as final then it becomes non inheritable and it cannot be used as base class/struct. 

```cpp
#include <iostream>
class Base final{}; 
class Derived : public Base{}; 
int main(){
    Derived d;
    return 0;
}
```

THIS WILL GIVE A COMPILE-TIME ERROR:

```bash
error: cannot derive from ‘final’ base ‘Base’ in derived type ‘Derived’
 class Derived : public Base
```







# Overloading<a name="overloading"></a>



## Overloading a method<a name="method"></a>

1. different methods having same name is possible

   1. *return type* has to be the *same*

2. these methods differ usually in number/type/both of input parameters.

3. related to **compile-time(static) polymorphism** 

4. ```cpp
   #include <iostream>
   
   using namespace std;
   
   class TreeNode{
   public:    
       int val;
       TreeNode *left, *right;
       TreeNode(){val = -1;left=NULL;right=NULL;}
       TreeNode(int d){val = d; left=NULL;right=NULL;}
       TreeNode(int val, TreeNode *leftP){val = val; left=leftP;right=NULL;}
       TreeNode(int d, TreeNode *leftP, TreeNode *rightP){val = d; left=leftP;right=NULL;right=rightP;}
   };
   
   int main(){
   	TreeNode *n1 = new TreeNode();
   	int v;cin >> v;
   	TreeNode *n2 = new TreeNode(v);
   	int v2; cin >> v2;
   	TreeNode *n3 = new TreeNode(v2, n1, n2);
   	cout << "Node-1: " << n1->val << endl;
   	cout << "Node-2: " << n2->val << endl;
   	cout << "Node-3 : " << n3->val << ", left = " << n3->left->val << ", right = " << n3->right->val << endl;
   	return 0;
   }
   ```

5. here the constructor method itself is being overloaded.

6. other-method loading

   ```cpp
   #include <iostream>
   using namespace std;
   class Addition {
   public:
       int sum(int num1,int num2) {
           return num1+num2;
       }
       int sum(int num1,int num2, int num3) {
          return num1+num2+num3;
       }
   };
   ```

7. not just class-methods, even functions can be overloaded

   ```cpp
   // this code works
   int sum(int n1, int n2){return n1+n2;}
   int sum(int n1, int n2, int n3){return n1+n2+n3;}
   ```

8. functions having **different return types** and **same parameter list cannot be overloaded**

   1. w.r.t. functions, and not methods, we encounter this:

      ```bash
      error: ambiguating new declaration of ‘double sum(int, int)’
      ```

   2. w.r.t. class methods, we encounter this error:

      ```cpp
      class Ab{
      public:
      	int sum(int n1, int n2){return n1+n2;}
      	double sum(int n1, int n2){return (double)n1+(double)n2;}
      	// int sum(int n1, int n2, int n3){return n1+n2+n3;}
      };
      /*
      ERROR:
      error: ‘double Ab::sum(int, int)’ cannot be overloaded
      */
      ```



### Advantage

1. The main advantage of function overloading is to the **improve** the **code readability** and **allows code re-usability**. 
2. In the above sum-example, we have seen how we were able to have more than one function for the same task(addition) with different parameters, this allowed us to add two integer numbers as well as three integer numbers, if we wanted we could have some more functions with same name and four or five arguments.
3. Imagine if we didn't have function overloading, we either have the limitation to add only two integers or we had to write different name functions for the same task addition, this would reduce the code readability and re-usability.
   1. we would have had to write `add2`(add 2 numbers), `add3`(add 3 numbers), `add4`(add 4 numbers).... , and this is just for the same type of parameters, i.e. `int add(int n1, int n2)` and `int add(double n1, double n2)` are the same overloaded functions, thus no code/name change needed, but if overloading as a concept didn't exist, we would have had to write `int add1(int n1, int n2)` and `int add2Double(double n1, double n2)`, thus hampering the readability of the code.







# Overriding<a name="overriding"></a>

1. method having a different implementation in the sub-class, as compared to its super class

2. name, return type, (number, types and order)---> of parameters are all the same, the function body is the only thing that differs.

3. `@override` is written before the method signature(python and JAVA), so as to notify that this method is being overridden in this sub-class

   1. for c++

      ```cpp
      class Parent{
      public:
      	virtual int sum(int n1, int n2){return n1+n2;}
      	// int sum(int n1, int n2, int n3){return n1+n2+n3;}
      };
      
      class Child: public Parent{
      public:
      	int sum(int n1, int n2, int n3){return n1+n2+n3;}
      };
      ```

4. if we fail to write this `@override` to specify that we want to override a super-class method in its inheriting subclass, we will get a *compile-time error*

   ```java
   class Parent {
       void method() System.out.println(“P”);
   }
   class Child extends Parent {
   	void method() System.out.println(“C”);
   }
   ```

5. one of the way of achieving **runtime polymorphism**, as opposed to overloading, as mentioned previously, that achieves compile-time polymorphism

6. **final methods cannot be overridden**

   1. by definition, final keyword is used to prevent inheriting classes from overriding the method

   2. ```cpp
     class Base{
      public:
       virtual void myfun() final{cout << "myfun() in Base";}
     };
     class Derived : public Base{
         void myfun(){cout << "myfun() in Derived\n";}
     };
     ```
     
     Error:
     
     ```bash
     prog.cpp:14:10: error: virtual function ‘virtual void Derived::myfun()’
          void myfun()
               ^
     prog.cpp:7:18: error: overriding final function ‘virtual void Base::myfun()’
          virtual void myfun() final 
     ```
     
   3. for JAVA, [click here]()

7. **static methods** can also **not be overridden**

   1. When you define a static method with same signature as a static method in base class, it is known as [method hiding](https://www.geeksforgeeks.org/can-we-overload-or-override-static-methods-in-java/).
   2. 