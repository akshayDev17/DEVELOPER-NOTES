# Pickle-Serialization and deserialization<a name="pickle-serialization"></a>

1. to refer to the main concept and notes, [click here]()
2. *Pickling* is the process whereby a Python object hierarchy is converted into a byte stream, and *unpickling* is the inverse operation, whereby a byte stream (from a [binary file](https://docs.python.org/3/glossary.html#term-binary-file) or [bytes-like object](https://docs.python.org/3/glossary.html#term-bytes-like-object)) is converted back into an object hierarchy. 
3. Pickling (and unpickling) is alternatively known as “serialization”, “marshalling,”  or “flattening”; however, to avoid confusion, the terms used here are “pickling” and “unpickling”.
4. `pickle.save()` ==> pickling, `pickle.load()` ==> unpickling
5.  



### Deep-copying a datastructure

1. copy contents of an object into a completely new variable, i.e. new memory location, rather can creating a variable solely for the purpose of pointing it to the originally instantiated object-address-location.
2. this happens through [serialization]().