//: [Previous](@previous)

import Foundation

//: ========Our style========
//func load(then handler:@escaping(Data?, Error?)->Void){}

//: =======Now this with resultType=======
enum Result<Value>{
    case success(Value)
    case failure(Swift.Error)
}

//: Reuse result type
func load(then handler:@escaping(Result<Data>)->Void){}

load { (result) in
    switch result {
    case .success(let data):
        // Handle the load data
        print("success data")
    case .failure(let error):
        // Handle the error
        print("success data")
    }
}



//: [Next](@next)
