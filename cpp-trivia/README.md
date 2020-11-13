# Table of Contents

1. [How are vectors implemented](#vectors-implementation)
2. [Sort()](#cpp-sort)
3. [Abstract classes and interfaces](#abstract-classes-interfaces)



# How are vectors implemented?<a name="vectors-implementation"></a>

1.  Vector elements are placed in **contiguous storage** so that they can be accessed and traversed using iterators. 
   1.  vector allocates a memory on heap
   2.   if memory it allocated initially is completely filled, then resizing happens
      1.  resized sizes - 1, 2, 4, 8, 16, 32 ....
      2.  hence, if initially an empty vector is declared, and values are pushed into it, the points where the size exceeds 1, 2, 4... a resizing will take place, thus making the final **capacity** as 2, 4, 8....
      3.  this is done by allocating a bigger chunk of memory(hence chunk of size 2, 4, 8....) followed by copying all elements of the original vector into this , and after **successfully copying** the contents, the old memory is freed.
2.  In vectors, data is inserted at the end. 
   1. Inserting at the end takes differential time, as sometimes there may be a need of extending the array. 
3.  Removing the last element takes only constant time because no resizing happens. 
4.  Inserting and erasing at the beginning or in the middle is linear in time.





# Sort()<a name="cpp-sort"></a>

The **std::sort()** function which is present in C++ STL is a hybrid sorting algorithm provides average and worst case time complexity of **O(nlogn)**. The sorting algorithm which it uses is called Introsort.
**Introsort** is combination of both quicksort and heapsort, It begins with quicksort and switch to heapsort if recursion depth exceeds a level based on the number of elements being sorted.





# Abstract classes and interfaces<a name="abstract-classes-interfaces"></a>

```c++
// Base class
class Shape {
   public:
      // pure virtual function providing interface framework.
      virtual int getArea() = 0;
      void setWidth(int w) {
         width = w;
      }
   
      void setHeight(int h) {
         height = h;
      }
   
   protected:
      int width;
      int height;
};
 
// Derived classes
class Rectangle: public Shape {
   public:
      int getArea() { 
         return (width * height); 
      }
};
```



1. the line `virtual <datatype> functionName() = 0;` declares that this method can be abstracted by the inheriting class(official syntax, the actual method can also be of a void return type, still we have to declare it in this way).
2. 