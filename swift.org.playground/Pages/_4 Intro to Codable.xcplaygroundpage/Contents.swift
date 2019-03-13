//: [Previous](@previous)
/*:
 # Intro to Codable
 */
import Foundation

enum SerializationError: Error{
    case missing(String)
    case invalid(String, Any)
}

let blogPost = """
{
    "post1":{
        "title": "The complete understanding of Delegate",
        "subtitle": "No more guessing",
        "markdown": "# Title",
        "author": "Bob Lee",
        "tags": ["delegate", "object"]
    },
}
""".data(using: .utf8)!

let geeks = """
[{
    "stackOverflowId": "bobthedev",
    "name": "Bob",
    "platform":"iOS"
},{
    "stackOverflowId": "chhuon",
    "name": "Chhuon",
    "platform":"iOS"
},{
    "stackOverflowId": "dara",
    "name": "Dara",
    "platform":"Android"
},{
    "stackOverflowId": "makara",
    "name": "Makara",
    "platform":"Android"
}]
""".data(using: .utf8)

struct User: Codable{
    var name: String
    var loginMethods: [LoginMethods]
    var numberOfFriends: Int
    
    enum LoginMethods: String, Codable {
        case facebook, instagram, linkedin, twitter
    }
}

let jsonEncoder = JSONEncoder()
jsonEncoder.outputFormatting = .prettyPrinted
//var data: Data?
//do{
//    let jsonData = try jsonEncoder.encode()
//}

//: [Next](@next)
