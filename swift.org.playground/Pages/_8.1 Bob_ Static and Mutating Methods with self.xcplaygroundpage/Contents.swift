//: [Previous](@previous)
/*:
 # 2. Static and Mutating Methods with self
 ...from Bob the developer
 */
import Foundation

enum Storyboard: String{
    case profile
    case newsfeed
    case setting
    var identifier: String{
        return self.rawValue
    }
}

func describeStoryboard(storyboard: Storyboard) -> String{
    switch storyboard {
    case .profile:
        return "\(storyboard.identifier): Profile Picture, follower"
    case .setting:
        return "\(storyboard.identifier): Logout, invite"
    case .newsfeed:
        return "\(storyboard.identifier): videos, texts"
    }
}

describeStoryboard(storyboard: .profile)
describeStoryboard(storyboard: .setting)
/*:
 1. Mutating Methods
 */
enum MealProcess: String{
    case breakfast, lunch, dinner
    
    var description: String{
        return self.rawValue
    }
    
    mutating func nextMeal(){
        print("Time to move on from \(self.description)")
        
        switch self {
        case .breakfast:
            self = .lunch
            print("This is lunch")
        case .lunch:
            self = .dinner
            print("This is dinner")
        case .dinner:
            self = .breakfast
            print("This is breakfast")
        }
    }
}

var currentMeal = MealProcess.breakfast
currentMeal.nextMeal()
currentMeal.nextMeal()
currentMeal.nextMeal()
/*:
 2. Static Methods
 */
// ============ This ===========

//enum AppleDevices{
//    case iWatch, iPhone, iMac, MacPro
//
//    static func getAppleDevice(name:String) -> AppleDevices?{
//        switch name {
//        case "iWatch":
//            return .iWatch
//        case "iPhone":
//            return .iPhone
//        case "iMac":
//            return .iMac
//        case "MacPro":
//            return .MacPro
//        default:
//            return nil
//        }
//    }
//}
//
//let product = AppleDevices.getAppleDevice(name: "iPhone")

// ============ Or this ===========

enum AppleDevices: String{
    case iWatch, iPhone, iMac, MacPro
    
    private static func getProduct(name: String) -> AppleDevices?{
        return AppleDevices(rawValue: name)
    }
    
    static func getAppleDevice(enterName: String) -> AppleDevices?{
        switch enterName {
        case "iWatch", "iPhone", "iMac", "MacPro":
            return getProduct(name:enterName)
        default:
            return nil
        }
    }
}

AppleDevices.getAppleDevice(enterName: "iWatch")

//: Custom Init
enum AppleDevice: String{
    case iWatch, iPhone, iMac, MacPro
    init?(name: String){
        if name == "iWatch"{
            self = .iWatch
        }else{
            return nil
        }
    }
}

AppleDevice(name: "iWatch")

//==========Example 1============

enum IntCategory{
    case small
    case medium
    case big
    case weird
    init(number: Int){
        switch number {
        case 0..<1000:
            self = .small
        case 1000..<100000:
            self = .medium
        case 100000..<1000000:
            self = .big
        default:
            self = .weird
        }
    }
}

IntCategory(number: 10000)

// ============Practical Case============
enum HttpError: String{
    case Code400 = "Bad Request"
    case Code401 = "Unauthorized"
    case Code402 = "Payment Required"
    case Code403 = "Forbidden"
    case Code404 = "Page Not Found"
    
    var description: String{
        return self.rawValue
    }
}
HttpError.Code400.description

//: Cell Identifier
enum CellType: String{
    case ButtonValueCell
    case UnitEditCell
    case LabelCell
    case ResultLabelCell
    
    var name: String{
        return self.rawValue
    }
}
CellType.ButtonValueCell.rawValue

import UIKit

enum NavigationTheme{
    case PlaceId
    case Warning
    case Danger
    var BarTinColor: UIColor{
        switch self {
        case .PlaceId: return UIColor.clear
        case .Warning: return UIColor.blue
        case .Danger: return UIColor.red
        }
    }
}

NavigationTheme.Danger.BarTinColor

//: [Next](@next)
