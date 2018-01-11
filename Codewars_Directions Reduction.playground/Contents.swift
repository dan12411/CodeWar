import UIKit

func dirReduc_MY(_ arr: [String]) -> [String] {
    var result: [String] = []
    
    for a in arr {
        if let last = result.last {
            
            if a == "NORTH" && last == "SOUTH" ||
               a == "SOUTH" && last == "NORTH" ||
               a == "WEST" && last == "EAST" ||
               a == "EAST" && last == "WEST"
            {
                result.removeLast()
            } else {
                result.append(a)
            }
        } else {
            result.append(a)
        }
    }
    
    return result
}

dirReduc_MY(["NORTH", "WEST", "SOUTH", "EAST"])


func canReduce(_ elem: String, _ last: String) -> Bool {
    switch (elem, last) {
    case ("NORTH", "SOUTH") : return true
    case ("SOUTH", "NORTH") : return true
    case ("WEST", "EAST") : return true
    case ("EAST", "WEST") : return true
    default: return false
    }
}
func dirReduc(_ arr: [String]) -> [String] {
    var res = [String]()
    for s in arr {
        if !res.isEmpty && (canReduce(s, res.last!)) {
            res.removeLast()
        } else {
            res.append(s)
        }
    }
    return res
}
