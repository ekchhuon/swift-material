//: [Previous](@previous)

import Foundation

struct WeekDays{
     var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    subscript(index:Int) -> String{
        return days[index]
    }
}
let weekdays = WeekDays()
weekdays[0]
weekdays.days

//: ===Set Get===

class DaysOfAWeek{
    private var days = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]
    subscript(index:Int) -> String{
        set{ self.days[index] = newValue }
        get{ return days[index] }
    }
}

let dow = DaysOfAWeek()
dow[0]

dow[0] = "Monday"
dow[0]

//: === JSON ===
struct JSON{
    private var storage: [String: Any]
    init(_ dictionary: [String:Any]) {
        self.storage = dictionary
    }
    subscript<T>(key:String) -> T?{
        return storage[key] as? T
    }
}
//: Create Obj
let republicOfKorea = JSON([
    "capital": "Seoul",
    "name": "Republic of Korea",
    "population": 500000
    ])

//republicOfKorea.storage["capital"] ==> // This is so tedeous

let koreaCapital: String? = republicOfKorea["capital"]
let name : String? = republicOfKorea["name"]
let population: Int? = republicOfKorea["population"]

//: [Next](@next)
