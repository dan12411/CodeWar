//: Playground - noun: a place where people can play

import UIKit

//func sumOfIntegersInString(_ string: String) -> Int {
//    var temp = ""
//    var numbers = [""]
//    let lastIndex = string.characters.count - 1
//
//    for (i,character) in string.characters.enumerated() {
//        var number = ""
//        if Int(String(character)) != nil && i != lastIndex {
//            temp.append(character)
//        } else if Int(String(character)) != nil && i == lastIndex {
//            temp.append(character)
//            number = temp
//        } else {
//            number = temp
//            temp.removeAll()
//        }
//
//        numbers.append(number)
//    }
//
//    let result = numbers.flatMap { Int($0) }.reduce(0, +)
//
//    return result
//}

func sumOfIntegersInString(_ string: String) -> Int {
    return string.components(separatedBy: CharacterSet.decimalDigits.inverted).flatMap({Int($0)}).reduce(0, +)
}

sumOfIntegersInString("The30quick20brown10f0x1203jumps914ov3r1349the102l4zy do1")
