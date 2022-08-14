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

# References
1. [Learn Swift Fast (2020) - Full Course For Beginners: CodeWithChris](https://www.youtube.com/watch?v=FcsY1YPBwzQ&list=PLrzJjlIkwgGrVZ0ja9CBOuNmg-smnHRZN&index=2)
2. [Swift 5.7 Documentation Book](https://docs.swift.org/swift-book/LanguageGuide/TheBasics.html)