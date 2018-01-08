import UIKit

let dict = [
    "I" : 1,
    "V" : 5,
    "X" : 10,
    "L" : 50,
    "C" : 100,
    "D" : 500,
    "M" : 1000,
]

func solution(_ string:String) -> Int {
    var result = 0
    let array = string.map { String($0) }
    for i in 0..<array.count {
        if let value = dict[array[i]] {
            if i <= array.count-2 {
                if let nextValue = dict[array[i+1]] {
                    result = value < nextValue ? result - value : result + value
                }
            } else {
                result += value
            }
        }
    }
    
    return result
}

solution("MMMCMXIV")

