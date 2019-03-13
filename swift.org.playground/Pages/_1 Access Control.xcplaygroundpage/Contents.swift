//: [Previous](@previous)
/*:
 # Access Control
 1. private (Most secure)
 2. fileprivate (use with file: Ex. fileprivate class MyViewController)
 3. internal
 4. public  can't overide
 5. open (Least secure) Can overide
 */
import Foundation
//: ===Ex 1.: ===
class Game{
    private var number = 0
    var score: Int{
        return number
    }
    
    func increaseNumberByOne() {
        number += 1
    }
}

//: === Or this===
class OtherGame{
    private(set) var score:Int
    init(score:Int) {
        self.score = score
    }
    func increaseNumberByOne() {
        score += 1
    }
}

//: ===Extension===
class MyStatus{
    private var isHappy = true
}

extension MyStatus {
    func checkStatus() {
        print(isHappy) // Swift 4 OK
    }
}

//: ===Open: Overidable | Public: Can't overide===
//public func a(){}
//open func b(){}
//
//overide func a(){}  // error
//overide func b(){}  // success
//: [Next](@next)
