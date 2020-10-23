# Table of Contents



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
2. 