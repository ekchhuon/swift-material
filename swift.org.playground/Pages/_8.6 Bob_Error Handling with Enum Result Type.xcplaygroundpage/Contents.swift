//: [Previous](@previous)
/*:
 # Error Handling with Enum Result Type
 */
import Foundation

//: ### HTTPS Request
enum HTTPError{
    case notFound404
    case forbidden403
}

//: Design Result Type
enum ResultType<T>{
    case success(T)
    case failure(HTTPError)
}

let success = ResultType.success("JSON")
let failure: ResultType<Any> = ResultType.failure(.notFound404)

//: Design Func and return error obj
func findSubdomain(domain:String) -> ResultType<String>{
    switch domain {
    case "business":
        return ResultType.failure(.forbidden403)
    case "blog":
        return ResultType.failure(.notFound404)
    default:
        return ResultType.success("Found website")
    }
}

let result = findSubdomain(domain: "business")

switch result {
case let .success(subDomainName):
    print(subDomainName)
case let .failure(errorType):
    switch errorType {
    case .notFound404:
        print("Not Found 404")
    case .forbidden403:
        print("Not Allowed 403")
    }
}


//: [Next](@next)
