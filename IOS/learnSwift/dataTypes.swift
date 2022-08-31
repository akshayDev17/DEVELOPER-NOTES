func add(arg a:Int, arg2 b:Int) -> Int {return a+b}
func subs(p a:Int, q b:Int) -> Int {return a-b}
func multiply(_ a:Int, _ b:Int) -> Int {return a*b}

// cannot change data types of variables once declared, like cpp/java ===> Type Safe Language
var str = "Hello World"
// str = 3 // cannot assign value of type 'Int' to type 'String'
str = "Bye"
print(str)

// declare a constant
/*
let x = "Hello"
x = "Bye" // cannot assign to value: 'x' is a 'let' constant
*/

// to declare the datatype in the variable declaration
var str2:String = "Foo Bar"
print(str2)
// Int, Float, Double, Bool

// Double is the default datatype for decimal
var x = 2.4
print(type(of: x))
print(type(of: type(of: x)))

var y = 12
if((y%2 == 0 && y%3 == 0)  || y%7 == 0){print("Yes")}
// {} are required, or else error is thrown

// you need exactly 3 dots
for i in 1...5 {
    print(i*5, type(of: i))
    // automatically assigns type to Int
}
var i = 10
while i < 10 {print(i);i+=1} // just like python , i++ doesn't work

// for the repeat-while loop, the loop-body is executed once and then the condition is evaluated

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
        print("\nSalary = \(self.salary), Name = \(self.name), Role = \(self.role)\n")
    }
}

// object
var emp1 = Employee()
emp1.printDetails()

var emp2 = Employee("SDE1", "John", 20000)
emp2.printDetails()
// print(emp1.)