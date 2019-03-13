//: [Previous](@previous)
/*:
 # 3. Nested Enum
 */
import Foundation

enum FutureCourse{
    enum LearnSwiftWithBob: String{
        case genericProtocol
        case advancedEnum
        
        var chapterDescription:String{
            return self.rawValue
        }
    }
    
    enum UIKitFundamentals:String{
        case realmFundamental
        case noStoryboard
        case cloudComputing
        
        var chapterDescription: String{
            return self.rawValue
        }
    }
}

FutureCourse.LearnSwiftWithBob.genericProtocol.chapterDescription
FutureCourse.UIKitFundamentals.noStoryboard.chapterDescription

// can be used to organize like game design.
struct Character{
    enum CharacterType{
        case prince
        case warrior
        case priest
    }
    
    enum Skill{
        case airwalk
        case transparency
        case prediction
    }
    
    let character:CharacterType
    let skill:Skill
}

let bob = Character(character: .priest, skill: .prediction)

// another example

enum Wearable{
    enum Weight: Int{
        case light
        case medium
        case heavy
    }
    enum Price: Int{
        case leather
        case iron
        case steel
    }
    
    case armor(weight:Weight, price:Price)
    
    func getDescription() -> String{
        switch self {
        case let .armor(weight, price):
            return "You have chosen \(weight) & \(price)"
        }
    }
}

let myClothes = Wearable.armor(weight: .light, price: .leather)
myClothes.getDescription()
/*:
 PS:  **Enum** first before **class** & **struct**
 */
//: [Next](@next)
