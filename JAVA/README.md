# Table of Contents

1. [reflection](#reflection)





# Reflections<a name="reflection"></a>

1. Using Java `Reflection` you can inspect the constructors of classes and instantiate objects at runtime. 
   1. This is done via the Java class `java.lang.reflect.Constructor`.



# Strings<a name="java-strings"></a>

1. Strings in Java are Objects that are backed internally by a char array. 
   1. Since arrays are immutable(cannot grow), Strings are immutable as well. 
   2. Whenever a change to a String is made, an **entirely new String is created**
2. Whenever a String Object is created, two objects will be created- 
   1. one in the Heap Area and 
   2. one in the String constant pool
   3. the String object reference always points to heap area object.
3. since each string object is cached in the string constant pool, strings have to be immutable.



## Mutable String alternatives<a name="mutable-alternatives"></a>

1. [StringBuffer](http://www.geeksforgeeks.org/stringbuffer-class-in-java/): 
   1. **StringBuffer** is a peer class of **String** that provides much of the functionality of strings. 
   2. String represents fixed-length, immutable character sequences while StringBuffer represents growable and writable character sequences.
2. The **StringBuilder**
   1.  in Java represents a mutable sequence of characters. 
   2. Since the String Class in Java creates and immutable sequence of characters, the StringBuilder class provides an alternate to String Class, as it creates a mutable sequence of characters.