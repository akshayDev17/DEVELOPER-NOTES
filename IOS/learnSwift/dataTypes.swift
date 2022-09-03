// 1. Type Safety verification
// cannot change data types of variables once declared, like cpp/java ===> Type Safe Language
var str = "Hello World"
// str = 3 // cannot assign value of type 'Int' to type 'String'
str = "Bye" // can change to another value of the same data type since this is a variable(not a constant)
print(str)

// 2. Constant should be constant
// declare a constant
/*
let x = "Hello"
x = "Bye" // cannot assign to value: 'x' is a 'let' constant
*/

// 3. Declaration with type
// to declare the datatype in the variable declaration
var str2:String = "Foo Bar"
print(str2)
// Int, Float, Double, Bool

// 4. Type inference of a floating-point decimal
// Double is the default datatype for decimal(since this is the Inferred Type by the compiler)
var x = 2.4
print(type(of: x))
print(type(of: type(of: x)))

// 5. Testing MODULO operator
var y = 12
if((y%2 == 0 && y%3 == 0)  || y%7 == 0){print("Yes")}
// {} are required, or-else error is thrown

// 6. Different types of Integer
var v1: UInt32  = 1239 // unsigned, will only have non-negative values
var v2: Int64 = 1000000007

// 7. Limits of an Integer Type
let minVal = UInt8.min, maxVal = UInt8.max
print("\nMinimum value of unsigned 8bit integer is = \(minVal), max is \(maxVal)\n") //  0 255

// 8. Proper syntax of print function
var s1="Hello", s2="World", s3="Bye",s4="bye!"
print(s1,s2,s3,s4,separator: "")
print(s1,s2,s3,s4,separator: " ", terminator: "\n")
// print numbers inside loop body without line-breaks
for i in 1...5 {
    print(i, terminator:" ")
} // 1 2 3 4 5
print("\n")

// 9. Two variables of strictly the same dataType can be added.
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
// let twoThousandAndOne_1 = twoThousand + one
let twoThousandAndOne_2 = twoThousand + UInt16(one) // this will have type UInt16 because both values to be added have that type.
// print("Type of twoThousandAndOne is \(type(of: twoThousandAndOne_1))")

// 10. The rule 9. doesn't apply on literals
let n4 = 1+0.4232;print("--",type(of: n4), "--")

// 11. Optional Int type checking.
// let var123 = nil returns compile error
var var123: Int? = nil;print("type of var123 is \(type(of: var123))")
if var123 == nil{ print("var123 has value nIL")}
var123 = 4; print("type of var123 post assignment is \(type(of: var123)) with value = \(var123!)")

// var possibleNum = "123"; let cnst = Int(possibleNum);let cnst2 = cnst;print("\n^^^Type of cnst is \(type(of: cnst)) and cnst2 is \(type(of: cnst2))^^^\n")
let possibleNumber = "123"
let myNumber = Int(possibleNumber) // This will be Optional
print("\nMy number is \(myNumber) of type \(type(of: myNumber))\nOn unwrapping its value is \(myNumber!)\n") // force unwrapping an optional
print("---=== \(type(of: myNumber!)) ===---")
// Here, myNumber is an optional integer
if let myNumber = myNumber { // this is called Optional Binding
    // Here, myNumber is a non-optional integer
    print("My number is \(myNumber) of type \(type(of: myNumber))")
}
// Prints "My number is 123"

// 13. performing decremental operations on an Optional Int with non-nil value !!! PROBLEM !!!
/*
while var myNumber_ = myNumber, myNumber_ > 120 {
    myNumber_-=1
    print("My number is \(myNumber_) of type \(type(of: myNumber_))")
}
print("post decrement, myNumber = \(myNumber!)")
*/

// 14. Implicitly Unwrapped Optionals
var impUnwrappedOptional: Int! = Int("swe123")
print("Type of implicitly unwrapped optional = \(type(of: impUnwrappedOptional)), with value = \(impUnwrappedOptional)")
// implicitly unwrapped optional will be force unwrapped so that its value can be assigned to an explicit non-optional variable
if var explicitNonOptional:Int = impUnwrappedOptional {
    print("Successfully unwrapped optional impUnwrappedOptional having value \(impUnwrappedOptional)")
}
else{
    print("Trying to unwrap optional impUnwrappedOptional having value \(impUnwrappedOptional)")
}
impUnwrappedOptional = 123;print("Type of implicitly unwrapped optional = \(type(of: impUnwrappedOptional))")

// 11. Checking data type of for loop iterator
// you need exactly 3 dots
for i in 1...5 {
    print(i*5, type(of: i))
    // automatically assigns type to Int
}
// checking whether i++ works
var i = 10
while i < 10 {print(i);i+=1} // just like python , i++ doesn't work

// for the repeat-while loop, the loop-body is executed once and then the condition is evaluated

// 12. Function declaration in mutiple ways
func add(arg a:Int, arg2 b:Int) -> Int {return a+b}
func subs(p a:Int, q b:Int) -> Int {return a-b}
func multiply(_ a:Int, _ b:Int) -> Int {return a*b}

// cannot switch up order of arg, arg2, arg3.... , 
// arg, arg2, arg3 can be anything: p, q, a, t, etc
// you can also omit this, see mutliply()
print(add(arg: 9, arg2: 10)); print(subs(p: 9, q: 10)) ; print(multiply(7, 8))

class Employee {
    var role = ""
    var name = ""
    var salary = 0

    // init() {self.role="";self.name="";self.salary=0}
    init() {}
    init(_ role:String, _ name: String, _ salary: Int){self.role = role;self.name=name;self.salary=salary}

    func setRole(_ newRole:String){self.role = newRole}
    func setName(_ newName:String){self.role = newName}
    func setSalary(_ newSalary:Int){self.salary = newSalary}

    func printDetails(){
        print("\nSalary = \(self.salary), Name = \(self.name), Role = \(self.role)\n") // this style of printing = String Interpolation
    }
}

// object
var emp1 = Employee()
emp1.printDetails()

var emp2 = Employee("SDE1", "John", 20000)
emp2.printDetails()
// print(emp1.)