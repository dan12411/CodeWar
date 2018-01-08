import UIKit

extension Character {
    var isLowercase: Bool {
        guard self.asciiValue != nil else {
            return false
        }
        
        return self.asciiValue! >= Character("a").asciiValue! &&
            self.asciiValue! <= Character("z").asciiValue!
    }
    
    var asciiValue: UInt32? {
        return String(self).unicodeScalars.first?.value
    }
}

func += (left: inout [String:Int], right: [String:Int]) {
    for (k, v) in right {
        if let old = left[k] {
            left[k] = old < v ? v : left[k]
        } else {
            left[k] = v
        }
    }
}

func composeString(header: String, length: Int, str: String) -> String {
    return header + Array(0..<length).map { _ in return str }.joined()
}

func mix(_ s1: String, _ s2: String) -> String {
    
    var dict1: Dictionary<String,Int> = [:]
    var dict2: Dictionary<String,Int> = [:]
    var dict3: Dictionary<String,Int> = [:]
    
    s1.characters.filter{ $0.isLowercase }.flatMap {
        if dict1[String($0)] != nil {
            dict1[String($0)]! += 1
        } else {
            dict1[String($0)] = 1
        }
        return String($0)
    }
    
    s2.characters.filter{ $0.isLowercase }.flatMap {
        if dict2[String($0)] != nil {
            dict2[String($0)]! += 1
        } else {
            dict2[String($0)] = 1
        }
        return String($0)
    }
    print(dict1)
    print(dict2)
    
    dict3 = dict1
    dict3 += dict2
    
    print(dict3)
    
    let sortedArray = Array(dict3.keys).sorted {
        dict3[$0]! > dict3[$1]!
    }

    print(sortedArray)
    
    var resultArray: [String] = []
    for k in sortedArray {
        
        if let s1v = dict1[k], let s2v = dict2[k], s1v > 1, s2v > 1 {
            if s1v > s2v {
                resultArray.append(composeString(header: "1:", length: s1v, str: k))
            } else  if s1v < s2v {
                resultArray.append(composeString(header: "2:", length: s2v, str: k))
            } else {
                resultArray.append(composeString(header: "E:", length: s2v, str: k))
            }
        } else if let s1v = dict1[k], s1v > 1 {
            resultArray.append(composeString(header: "1:", length: s1v, str: k))
        } else if let s2v = dict2[k], s2v > 1 {
            resultArray.append(composeString(header: "2:", length: s2v, str: k))
        }
    }
    
    print (resultArray)
    var result: [[String]] = []
    var index = Int.max
    var i = 0
    
    resultArray.flatMap {
        if $0.count < index {
            result.append([$0])
            i += 1
        } else if $0.count == index {
            result[i-1].append($0)
        }
        
        index = $0.count
        return $0
    }
    
    for i in 0..<result.count {
        result[i].sort()
    }
    print (result)
    
    return result.joined().joined(separator: "/")
}



mix(" In many languages", " there's a pair of functions")

func onlyLowercaseCharacters(of str: String) -> [Character] {
    return str.characters.filter {$0 >= "a" && $0 <= "z"}
}

////////////////////////
/// other's solution ///
////////////////////////
func mix2(_ s1: String, _ s2: String) -> String {
    let alphabet = "abcdefghijklmnopqrstuvwxyz"
    var result : [(String,String)] = [(String,String)]()
    for ch in alphabet.characters {
        let s1Count = s1.components(separatedBy:String(ch)).count-1
        let s2Count = s2.components(separatedBy:String(ch)).count-1
        if max(s1Count,s2Count) > 1 {
            if s1Count > s2Count {
                result.append(("1",String(repeating: String(ch), count:s1Count)))
            } else if s1Count == s2Count {
                result.append(("E",String(repeating: String(ch), count:s1Count)))
            } else {
                result.append(("2",String(repeating: String(ch), count:s2Count)))
            }
        }
    }
    return result.sorted(by:{ $0.1.characters.count > $1.1.characters.count || ($0.1.characters.count == $1.1.characters.count && $0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1)) }).map({$0+":"+$1}).joined(separator: "/")
}
