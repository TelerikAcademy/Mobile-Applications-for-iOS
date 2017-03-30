//: Playground - noun: a place where people can play

import UIKit

func getRandom(withMin min: Int, andMax max: Int) -> Int {
    return (max + min) / 2
}

func getRandom2(min: Int, _ max: Int) -> Int {
    return (max + min) / 2
}

getRandom(withMin: 5, andMax: 10)
getRandom2(min: 2, 10)

func sum(arr: [Int]) -> Int {
    var s = 0
    
    // for with indices
    //    for i in 0..<arr.count {
    //        s += arr[i]
    //    }
    
    // for with values
    for number in arr {
        s += number
    }
    
    return s
}

sum(arr: [1, 2, 3])
