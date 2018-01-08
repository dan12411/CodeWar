//: Playground - noun: a place where people can play

import UIKit

//func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
//    var arr: Array<Int> = []
//    arr.reserveCapacity(n)
//
//    guard n > 0 else { return arr }
//
//    for i in 1...n {
//        if i < 4 {
//            arr.append(signature[i-1])
//        } else {
//            let new = arr[i-2]+arr[i-3]+arr[i-4]
//            arr.append(new)
//        }
//    }
//
//    return arr
//}

func tribonacci(_ signature: [Int], _ n: Int) -> [Int] {
    guard n > 3 else {
        return Array(signature.prefix(n))
    }
    
    var result = signature
    var next = result.reduce(0, + )
    for index in 0..<(n - 3) {
        result.append(next)
        next = next * 2 - result[index]
    }
    return result
}
