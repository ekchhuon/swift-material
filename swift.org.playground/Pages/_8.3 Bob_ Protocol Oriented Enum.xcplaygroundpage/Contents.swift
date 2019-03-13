//: [Previous](@previous)
/*:
 # 4. Protocol Oriented Enum
 Combind protocol with enum
 */
import Foundation
protocol LifeSpan{
    var numberOfHearts: Int{ get }  // get = settable + settable
    mutating func increaseHeart()   // heart +1
    mutating func getAttacked()     // heart -1
}

enum Player: LifeSpan{
    case dead
    case alive(currentHeart:Int)
    
    var numberOfHearts: Int{
        switch self {
        case .dead: return 0
        case let .alive(numberOfHearts):
            return numberOfHearts
        }
    }
    
    mutating func increaseHeart() {
        switch self {
        case .dead:
            self = .alive(currentHeart: 1)
        case let .alive(numberOfHearts):
            self = .alive(currentHeart: numberOfHearts + 1)
        }
    }
    
    mutating func getAttacked() {
        switch self {
        case let .alive(numberOfHearts):
            if numberOfHearts <= 1{
                self = .dead
            }else {
                self = .alive(currentHeart: numberOfHearts - 1)
            }
        case .dead:
            break
        }
    }
}

//: Play Game
var state = Player.dead
state.increaseHeart()
state.numberOfHearts
state.increaseHeart()
state.getAttacked()
state.getAttacked()

//: ======= Custom Operator =======
enum GameAction{
    case start
    case pause
    case stop
    case restart(delay: Int)
}

// GameAction.stop = GameAction.stop
func ==(lsh: GameAction, rsh: GameAction) -> Bool{
    switch (lsh, rsh) {
    case (.start, .start), (.pause, .pause), (.stop, .stop):
        return true
    case let (.restart(lhsDelay), .restart(rhsDelay)):
        return lhsDelay == rhsDelay
    default:
        return false
    }
}

GameAction.restart(delay: 10) == GameAction.restart(delay: 10)
GameAction.start == GameAction.start

//: [Next](@next)
