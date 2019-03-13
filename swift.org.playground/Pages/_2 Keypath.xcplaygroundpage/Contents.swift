//: [Previous](@previous)
/*:
 # Keypath
 */
import Foundation

//: Desing Model
struct Developer{
    var platform: Platform
    var information: Information
}
enum Platform{
    case iOS
    case android
}

struct Information{
    var name, strengths, motivation: String
}

//: Create Objects
let robInfo = Information(name: "Rob", strengths: "Zenness", motivation: "Change the world")
let bobInfo = Information(name: "Bob", strengths: "Dryness", motivation: "None")

let rob = Developer(platform: .android, information: robInfo)
let bob = Developer(platform: .iOS, information: bobInfo)

//: === 😢 Your past : Repeating yourself ===
rob.information.name
bob.information.name
rob.platform
bob.platform

//: === 😍 Introduce Swift 4 Key Path ===
//: Access through "Path"
let bobPlatform = bob[keyPath: \Developer.platform]     // iOS
let bobName = bob[keyPath: \Developer.information.name] // 'Bob'

//: Store Path
let informationKeyPath = \Developer.information
let bobInf = bob[keyPath: informationKeyPath]
let robInf = rob[keyPath: informationKeyPath]

//: Append KeyPath
let nameKeyPath = informationKeyPath.appending(path: \.name)
bob[keyPath: nameKeyPath]   // "Bob"
rob[keyPath: nameKeyPath]   // "Rob"

//: ========
struct Person {
    var name: String
    
    func greet() {
        print("Hello \(name)!")
    }
}

//: ===This===
let p = Person(name: "Chhuon")
let greeter = p.greet
greeter()

//: ===Or this===
//let getName = { (p: Person) in p.name }
//print(getName(p))

//: ===Swift 4===
let getName = \Person.name
let kp = p[keyPath:getName]
print(kp)
// or just this
print(p[keyPath:\Person.name])

let path = \Person.name
var person = Person(name: "Chhuon2")
person[keyPath: path] = "Ek Chhuon"
p.greet()


//: [Next](@next)
