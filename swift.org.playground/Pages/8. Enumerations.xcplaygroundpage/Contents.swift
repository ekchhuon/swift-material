//: [Previous](@previous)
/*:
 # Enumerations
 */
import Foundation
import UIKit

enum CompassPoint{
    case north
    case south
    case east
    case west
}

enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
/*:
 1. Matching Enumeration Values with a Switch Statement
 */
// -------------1. Basics-----------
let directionToHead = CompassPoint.north
switch directionToHead {
case .north:
    print("Go to north") // "Go to north"
case .south:
    print("Go to south")
case .east:
    print("Go to east")
case .west:
    print("Go to west")
}

// -------- 2. Default case ---------
var somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless") // "Mostly harmless"
default:
    print("Not a safe place for humans")
}
/*:
 2. Iterating over Enumeration Cases
 */
// ---------1. CaseIterable & allCases---------
enum Beverage: CaseIterable {
    case coffee, tea, juice
}



let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")
// Prints "3 beverages available"

// --------------2. for loop-----------------
for beverage in Beverage.allCases {
    print(beverage)
}
// coffee
// tea
// juice
/*:
 3. Associated Values
 */
// -----------------
let upc = UIImage(named: "barcode_UPC_2x.png")
let qrc = UIImage(named: "barcode_QR_2x.png")

// --------1. Define---------
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}

// --------2. Create---------
var productBarcode = Barcode.upc(8, 85909, 51226, 3)
productBarcode = .qrCode("ABCDEFGHIJKLMNOP")

// -----------3. with var or let prefix----------
switch productBarcode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

// ---------4. single var or let:: only if all value are constants or variable  --------
switch productBarcode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}
// Prints "QR code: ABCDEFGHIJKLMNOP."

// --------- or --------
let qrCode = Barcode.qrCode("ABCDEFGHIJKLMNOP")
let upcCode = Barcode.upc(8, 85909, 51226, 3)

if case let Barcode.qrCode(value) = qrCode{
    print(value)
}

if case let Barcode.upc(numberSystem, manufacturer, product, check) = upcCode{
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
}

/*:
 4. Raw Values
 */
// -------1. define------
enum Planet2: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, neptune
}
enum CompassPoint2: String {
    case north, south, east, west
}
//--------2. access raw value--------
let earthOrder = Planet2.mercury.rawValue   // 1
let venus = Planet2.venus.rawValue          // 2
let earth = Planet2.earth.rawValue          // 3

let sunsetDirection = CompassPoint2.north.rawValue // "north"
/*:
5. Initializing from a Raw Value
*/
// ------1.------
let mars = Planet2(rawValue: 4)            // mars
// possiblePlanet is of type Planet? and equals Planet.mars

// ------2.------
let positionToFind = 7
if let somePlanet = Planet2(rawValue: positionToFind){
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for human")
    }
}else{
    print("There isn't a planet for position \(positionToFind)")
}
/*:
 6. Recursive Enumerations
 */
//  A recursive enumeration is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. You indicate that an enumeration case is recursive by writing indirect before it, which tells the compiler to insert the necessary layer of indirection.

//--------define--------
enum ArithmeticExpression{
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

//--------or this:: only if enum's cases have associated value ---------
indirect enum ArithmeticExpression2{
    case number(Int)
    case addition(ArithmeticExpression2, ArithmeticExpression2)
    case multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

let four = ArithmeticExpression2.number(4)
let five = ArithmeticExpression2.number(5)
let sum = ArithmeticExpression2.addition(four, five)
let product = ArithmeticExpression2.multiplication(sum, ArithmeticExpression2.number(2))

func evaluate(_ expression: ArithmeticExpression2) -> Int{
    switch expression {
    case let .number(value):
        return value
    case let .addition(left, right):
        return evaluate(left) + evaluate(right)
    case let .multiplication(left, right):
        return evaluate(left) * evaluate(right)
    }
}

print(evaluate(product))

//: [Next](@next)

