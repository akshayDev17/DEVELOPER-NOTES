import SwiftUI
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        return origin
    }
}
var rect = Rect()
print(rect.center)
// rect.center = Point(x: 0, y: 3);print(rect.center)

var x = 2
print("\(type(of: rect))")