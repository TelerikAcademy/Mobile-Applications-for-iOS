//: Playground - noun: a place where people can play

import UIKit
//
//func sum(_ numbers: [Int]) -> Int {
//    var s = 0
//
//    for n in numbers {
//        s += n
//    }
//
//    return s
//}
//
//func getRandom(from: Int = 0,
//               to: Int = 1000) -> Int{
//    print(from)
//    print(to)
//    return 5;
//}
//
//getRandom()
//getRandom(from: 3, to: 100)
//
//getRandom(from: 5)
//getRandom(to: 100)
//
//
//let sum = {(numbers: [Int]) -> Int in
//    var s = 0;
//    for n in numbers {
//        s += n
//    }
//
//    return s
//}
//
//sum([1, 2, 3])


var arr = [11, 22, 10, 11, 21, 22, 4, 1111, 12, 13, 4]

arr.sort()
arr.sorted(){$0 > $1}

let sorted = arr.sorted(){(x: Int, y: Int) -> Bool in
    if(x % 3 == y % 3){
        return x % 7  > y % 7
    }
    
    return x % 3 < y % 3
}

sorted
