# Pickle-Serialization and deserialization<a name="pickle-serialization"></a>

1. to refer to the main concept and notes, [click here]()
2. *Pickling* is the process whereby a Python object hierarchy is converted into a byte stream, and *unpickling* is the inverse operation, whereby a byte stream (from a [binary file](https://docs.python.org/3/glossary.html#term-binary-file) or [bytes-like object](https://docs.python.org/3/glossary.html#term-bytes-like-object)) is converted back into an object hierarchy. 
3. Pickling (and unpickling) is alternatively known as “serialization”, “marshalling,”  or “flattening”; however, to avoid confusion, the terms used here are “pickling” and “unpickling”.
4. `pickle.save()` ==> pickling, `pickle.load()` ==> unpickling
5.  



### Deep-copying a datastructure

1. copy contents of an object into a completely new variable, i.e. new memory location, rather can creating a variable solely for the purpose of pointing it to the originally instantiated object-address-location.
2. this happens through [serialization]().

# why do we write `__name__=='__main__'`?
- Every Python script/module has a special built-in variable called`__name__`.
    - If the script is being run directly, `__name__` is set to `"__main__"`.
    - If the script is being imported as a module, `__name__` is set to the module's name (i.e., the filename without `.py`).
- we check this so as to prevent any/all global code in the script when it is imported as a module
    - check the `example-__name__` directory files for explanation
- 

# Private variables in python
- convention: `__var_`
- checkout the `private_var_eg.py` example

# Heap using `heapq`
- by default, `heapq.heapify` creates a min-heap out of a given list
- to implement a max-heap, refer to the [`max_heap_example.py`](max_heap_example.py)