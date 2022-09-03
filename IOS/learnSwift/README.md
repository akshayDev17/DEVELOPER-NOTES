# Basics
1. constants: variables whose value once set cannot be changed: `let x = "Hello World"`
2. Tuples - group values belonging to different data types. **READ TUPLES FROM THE DOC.**
2. Optionals - `var x: String?` , meaning there is a variable `x` of type `String`, whose *value* can either be `String` *or* be `nil`.
    1. nil is the default value until this variable is set to some another value.(`type = Optional<Int>`)
    2. `let var123 = nil` IS NOT ALLOWED. nil needs context(`Optional<SomeDefinedType>`)
    3. Read about Forced Unwrapping.(runtime error if nil is unwrapped)
    4. Checkout the problem with Optional Binding within a while loop(condition body).
    5. Implicitly Unwrapped optionals Usecase: on declaration might have a value, but once value is set will never become nil.
        To declare these use `var x: String!`
        1. No need of force unwrapping(`x!`) it, `print(x)` will do the trick.
        2. Data Type will still remain `Optional<Type>`, and the value could still be nil. 
            > When you use an implicitly unwrapped optional value, Swift first tries to use it as an ordinary optional value; if it can’t be used as an optional, Swift force-unwraps the value. 
        3. 
3. Type safe - meaning once a variable is given a value of a particular data type, cannot be assigned a value of another data type.
    1. Compile error is thrown if type safety is violated.
4. can define multiple related variables of the same type on a single line
    1. for multiple variables in a single line but with different types, variables with similar types can be subgrouped, but all subgroups will have to explicitly provide the data type.
5. for variables declared with assignment value but no datatype, the documentation says that:
    > If you provide an initial value for a constant or variable at the point that it’s defined, Swift can almost always infer the type(called *Type Inference*) to be used for that constant or variable, as described in Type Safety and Type Inference.
6. [Naming Constants and Variables](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)
7. If a variable name is the same as a reserved keyword in Swift, as per Swift doc:
    > surround the keyword with backticks (`) when using it as a name. \
    > **However, avoid using keywords as names unless you have absolutely no choice**.
8. Refer [HERE](dataTypes.swift) to actual syntax of print function.
    1. printing via String interpolation(`"\(varName)"`)(print variables in the same line along with text)
9. Multiline comments can be nested, i.e. 
    ```swift
    /* 
    This is parent comment
        /*
        This is child comment
        */
    */
    ```
10. Integer Bounds: 
    ```swift
    let minVal = UInt8.min, maxVal = UInt8.max
    ```
    1. Read about bits size of Float and Double, also their precision bit-length.
11. **Numeric Literals**: decimal system `let x=17`, binary system: `let x = 0b10111`(0b), octal: `let x=0o01572`(0o), hexadecimal: `let x=0x1a4568e`, exponentials: `let x=1.25e-2`(means 1.25*10^(-2) = 0.0125), `let x = 1.9e4`(19000)
    1. since e is itself in a hex notation, `p` is used, but it means `2^(p)`, rather than 10 as the base.
    2. Refer Documentation:
        > Both integers and floats can be padded with extra zeros and can contain underscores to help with readability. \
    3. 
12. Guess what'll this do:?
    ```swift
    let twoThousand: UInt16 = 2_000
    let one: UInt8 = 1
    let twoThousandAndOne_1 = twoThousand + one
    let twoThousandAndOne_2 = twoThousand + UInt16(one)
    ```
    1. two variables of different UInt/Int types as well cannot be added \
        also, an Int and a Double cannot be added: 
        ```swift
        let n1 = 3, n2 = 2.234
        let n3 = n1 + n2  /* compile error */
        let n4 = 1+0.4232 /* allowed since both of these are literals, and n4 will have Double as its type. */
        ```
    2. Hence, if you want to *typecast* a *small Int to a large Int*, use `Int64(varName)`\
        As per the Doc: 
        > The rules for combining numeric constants and variables are different from the rules for numeric literals. The literal value 3 can be added directly to the literal value 0.14159, because number literals don’t have an explicit type in and of themselves. Their type is inferred only at the point that they’re evaluated by the compiler.
13. Type Aliases(`typealias AudioSample = UInt16`)
14. Booleans
    ```swift
    let i=1
    if i{
        // compile error, since unlike cpp, this doesn't redirect to if i != 0
    }
    ```
    You will always need a boolean for the conditional expression part of if-else statements.
15. 

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