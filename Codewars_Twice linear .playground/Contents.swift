import UIKit

func u(_ n: Int) -> [Int] {
    var result: [Int] = []
    var i = 1
    while result.count <= n {
        result.append(2 * i + 1)
        result.append(3 * i + 1)
    }
    
    result
}


func dblLinear(_ n: Int) -> Int {
    return 0
}
