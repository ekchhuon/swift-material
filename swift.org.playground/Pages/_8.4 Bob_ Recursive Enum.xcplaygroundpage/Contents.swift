//: [Previous](@previous)

import Foundation
indirect enum ArithmeticExpressions{
    case number(Int)
    case addition(ArithmeticExpressions, ArithmeticExpressions)
    case multiplication(ArithmeticExpressions, ArithmeticExpressions)
}

//ArithmeticExpressions.addition(.number(10), .number(10))
let four = ArithmeticExpressions.number(4)
let five = ArithmeticExpressions.number(5)
let sum = ArithmeticExpressions.addition(four, five)

func evaluate(_ expression: ArithmeticExpressions) -> Int{
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

evaluate(sum)

//: ========Alternative normal enum=======
enum Operation {
    case addition(Int, Int)
    case multiplication(Int, Int)
    
    var result:Int{
        switch self {
        case let .addition(number1, number2):
            return number1 + number2
        case let .multiplication(number1, number2):
            return number1 * number2
        }
    }
}

Operation.addition(3, 5).result
Operation.multiplication(3, 5).result

//: ===========Or use struct : (This is ugly)============
struct StructOperation{
    func addTwoNumbers(_ number1: Int, _ number2: Int) -> Int{
        return number2 + number2
    }
    
    func multiplyNumbers(_ number1:Int, _ number2: Int) -> Int {
        return number1 * number2
    }
}

StructOperation().addTwoNumbers(2, 5)

//: ===========Or use closure : (This is better)============
struct MathOperation{
    static let addition:(Int, Int) -> Int = {$0 + $1}
    static let multiplication: (Int, Int) -> Int = {$0 * $1 }
}

MathOperation.addition(6,7)
MathOperation.multiplication(6,7)

//: [Next](@next)
