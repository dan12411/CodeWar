//: Playground - noun: a place where people can play

import UIKit

func arrange(_ s: String) -> String {
    var subStrings = s.components(separatedBy: .whitespaces)
    for i in 0..<subStrings.count {
        if i % 2 == 0 {
            if i != subStrings.count - 1 && subStrings[i].count > subStrings[i+1].count {
                subStrings.swapAt(i, i+1)
            }
            subStrings[i] = subStrings[i].lowercased()
            
        } else {
            if i != subStrings.count - 1 && subStrings[i].count < subStrings[i+1].count {
                subStrings.swapAt(i, i+1)
            }
            subStrings[i] = subStrings[i].uppercased()
        }
    }
    
    return subStrings.joined(separator: " ")
}

arrange("after be arrived two My so")
arrange("way the my wall them him")
