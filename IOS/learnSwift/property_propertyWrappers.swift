
@propertyWrapper
struct privateProjectedValue {
    private var number: Int
    private(set) var projectedValue: Bool
    // public var projectedValue: Bool
    var wrappedValue: Int {
        get {return number}
        set{
            if newValue > 12 {projectedValue = true}
            number = min(12, newValue)
        }
    }
    init(){
        self.number = 0
        self.projectedValue = false
    }
}

@propertyWrapper
struct publicProjectedValue {
    private var number: Int
    public var projectedValue: Bool
    var wrappedValue: Int {
        get {return number}
        set{
            if newValue > 12 {projectedValue = true}
            number = min(12, newValue)
        }
    }
    init(){
        self.number = 0
        self.projectedValue = false
    }
}


struct ImplicitlyWrappedProperty{
    @privateProjectedValue var x:Int
    @publicProjectedValue var y:Int
    // `@temp var s: String`: this is wrong since the property wrapper returns an Int

    func getX_projectedValue() -> Bool{return $x}
    mutating func setY_projectedValue(_ newVal: Bool) {$y = newVal}
}
struct ExplicitlyWrappedProperty {
    private var _x = privateProjectedValue()
    private var _y = publicProjectedValue()
    var x: Int {
        get{ return _x.wrappedValue }
        set{ _x.wrappedValue = newValue}
    }
    var y: Int {
        get{ return _y.wrappedValue }
        set{ _y.wrappedValue = newValue}
    }
    func getPrivateProjectedValue() -> Bool {return _x.projectedValue}
    func getPublicProjectedValue() -> Bool {return _y.projectedValue}

    /*
    func setPrivateProjectedValue(_ newVal: Bool) {_x.projectedValue = newVal} 
    _x.projectedValue is private , hence accessible only inside `struct privateProjectedValue {}`
    */
    mutating func setPublicProjectedValue(_ newVal: Bool) {self._y.projectedValue = newVal}
    /*
    the mutating keyword this makes _y.projectedValue mutable, thus makes this change possible
    */
}


var implicityWrapping = ImplicitlyWrappedProperty(), explicityWrapping = ExplicitlyWrappedProperty()
print("For implicitly wrapped, private x =", implicityWrapping.x, ", projected value =" , implicityWrapping.$x)
print("For implicitly wrapped, public x =", implicityWrapping.y, ", projected value =" , implicityWrapping.$y, "\n")
implicityWrapping.x = 14;implicityWrapping.y = 14
print("For implicitly wrapped, x =", implicityWrapping.x, ", projected value =" , implicityWrapping.$x)
print("For implicitly wrapped, public x =", implicityWrapping.y, ", projected value =" , implicityWrapping.$y, "\n")
/*implicityWrapping.$x = false;*/ /* if projectedValue inside the wrapper structure's 
code is a public variable this will work, if its private(set) it won't , 
error thrown: $x is immutable error */

print(implicityWrapping.$x, ", public projected value =", implicityWrapping.$y)
implicityWrapping.$y = !(implicityWrapping.$y)
print("public projected value =", implicityWrapping.$y, "\n\n")

// implicityWrapping.$x = false

print("For explicitly wrapped, private x =", explicityWrapping.x, ", projected value =" , explicityWrapping.getPrivateProjectedValue())
print("For explicitly wrapped, public x =", explicityWrapping.y, ", projected value =" , explicityWrapping.getPublicProjectedValue(), "\n")
explicityWrapping.x = 14;explicityWrapping.y = 14
print("For explicitly wrapped, private x =", explicityWrapping.x, ", projected value =" , explicityWrapping.getPrivateProjectedValue())
print("For explicitly wrapped, public x =", explicityWrapping.y, ", projected value =" , explicityWrapping.getPublicProjectedValue(), "\n")
// print("For explicitly wrapped, public x =", explicityWrapping.y, ", projected value =" , explicityWrapping.$y)
/*
Note: explicityWrapping._x and explicityWrapping._y will fail as _x and _y are private, accessible only within the structure definition.
i.e. within `struct ExplicitlyWrappedProperty{}`
*/
explicityWrapping.setPublicProjectedValue(!explicityWrapping.getPublicProjectedValue())
print("For explicitly wrapped, public x =", explicityWrapping.y, ", projected value =" , explicityWrapping.getPublicProjectedValue(), "\n")