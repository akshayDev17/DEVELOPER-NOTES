# Syntax Rules
1. no semicolon
2. [Collection Types: Sets, Arrays, Dictionaries](https://docs.swift.org/swift-book/LanguageGuide/CollectionTypes.html)
3. [Structures](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)

# Classes
1. [Reference Type, i.e. always passed by Reference](https://docs.swift.org/swift-book/LanguageGuide/ClassesAndStructures.html)

# Property
1. [Property](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617) w.r.t. a struct is nothing but the fields inside it.
    For instance: 
    ```Swift
    struct Resolution {
        var width = 0
        var height = 0
    }
    ```
    `width` and `height` are properties for the struct `Resolution`.
2. [Lazy Stored Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html) - used when their initial value depends on other variables uninitialized until the class itself is initialized.
3. [Computed Properties](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617)
4. [Property Observers](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617) - these capture and respond to property-value changes.
5. [Property Wrappers](https://docs.swift.org/swift-book/LanguageGuide/Properties.html#ID617)
    1. Property Wrappers need to have atleast one wrapped values having the literal name wrappedValue, or else an error is thrown.
    ```Swift
    @propertyWrapper
    struct temp{
        private var number = 0
        var x: Int{
            get {return number}
            set{ number = min(newValue, 12)}
        }
    }
    // error: Property wrapper type 'temp' does not contain a non-static property named 'wrappedValue'
    // fix: rename x to wrappedValue
    ```
    wrappedValue tells the Swift compiler which underlying value is being wrapped.
    2. Go through what [`private(set)` means (Getters and Setter)](https://docs.swift.org/swift-book/LanguageGuide/AccessControl.html)
    3. `someStructure.$someNumber` accesses the wrapper’s projected value.
6. Type Properties

# [Protocols<a name="#protocols"></a>](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
1. Example of other requirements?
2. Imp: if a class extends another superclass and protocol(s):
3. Swift reports an **error at compile time** if a protocol requirement isn’t fulfilled.

# [Generics<a name="generics"></a>](https://docs.swift.org/swift-book/LanguageGuide/Generics.html)
1. Naming convention of Type params for a generic function: **upper camel case names** (such as T and MyTypeParameter) to indicate that they're a placeholder for a type, not a value.
2. Read the Stack generic type example.
3. Type Constraints on the Generic Type declared.
    1. for instance the key of a Dictionary type should have a type conforming to the [Hashable Protocol](https://developer.apple.com/documentation/swift/hashable#2849490).)
    2. Or, if two variables of the same generic type need to be equated, that generic type should conform to the Equatable protocol.
4. ## Associated Types
    1. **!! Is not a property of a protocol, its actually a data type whose actual type is unknown(depends on how the protocol would be adopted) !!**
    2. Also checkout the Generic Type structure declared that conforms to the protocol having an associated Type. 
    3. Even these can conform to a protocol, thus adding constraints to an associated type.
    4. Using the same Protocol in Its Associated Type’s Constraints - the exact definition of the View protocol in SwiftUI(w.r.t. the body property of the View protocol, which is of type Self.Body, which is an associated type that adopts the View protocol)
    5. In the `Container,SuffixableContainer` example `Item` is required to *adopt* the `Equatable` protocol, which then **validates** the where `Suffix.Item == Item`.
        ```swift
        protocol Container{
            associatedtype Item: Equatable
            mutable func append(_ item: Item)
            var count: Int {get}
            subscript(i: Int) -> Item {get}
        }
        protocol SuffixableContainer: Container{
            associatedtype Suffix:  SuffixableContainer where Suffix.Item == Item /* this is an associated type that conforms to the current protocol being built */
            func suffix(_ i: Int) -> Suffix       
        }
        ```
        1. Also focus on the Extension using Stack on SuffixableContainer.
        2. A type(`m1`) that conforms to `SuffixableContainer` can have a `Suffix` type that's different from itself(`m2`, `m2 != m1`).
        3. Both `IntStack` and `Stack<Element>` are already defined in previous snippets, hence `extension` is used.
    6. 
5. Generic Where clauses: constraints on `associatedtypes` and `Protocols`, `associatedtypes` and other types.
    1. Try `allItemsMatch` function with Generic types,where clause, with `C1` being `Stack<Int>` and `C2 Stack<String>`.

# [Opaque Types<a name="opaque_types"></a>](https://docs.swift.org/swift-book/LanguageGuide/OpaqueTypes.html)
1. very similar to abstract classes in Java.
2. Allows for flexibility in property/function-return type.
   This is important because of the following:
3. Protocol type vs Opaque type
4. used to *hide* information on how the object was created,  

# References
1. [Learn Swift Fast (2020) - Full Course For Beginners: CodeWithChris](https://www.youtube.com/watch?v=FcsY1YPBwzQ&list=PLrzJjlIkwgGrVZ0ja9CBOuNmg-smnHRZN&index=2)
2. [Swift 5.7 Documentation Book](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)