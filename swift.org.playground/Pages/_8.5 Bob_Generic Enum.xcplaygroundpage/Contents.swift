//: [Previous](@previous)
/*:
 # Generic Enum
 */
import Foundation
enum Information<T, U>{
    case name(T)
    case website(T)
    case age(U)
}

let a = Information<String, Int>.age(20)

//: ====== Custom Optional ======
enum MyOptional<T>{
    case none // nil
    case some(T)
    
    init(_ anyValue: T){
        self = .some(anyValue)
    }
}

MyOptional(4)

//: [Next](@next)
