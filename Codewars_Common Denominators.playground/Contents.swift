
import UIKit

func gcd (_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func lcm (_ a: Int, _ b: Int) -> Int {
    return (a * b) / gcd(a,b)
}

func convertFracts(_ l: [(Int, Int)]) -> [(Int, Int)] {

    guard l.count != 0 else {
        return l
    }

    var newl = l
    var result: Array<(Int, Int)> = []
    
    for i in 0..<l.count {
        let g = gcd(l[i].0, l[i].1)
        newl[i].0 = l[i].0/g
        newl[i].1 = l[i].1/g
    }
    
    var dNumber: Int = newl[0].1
    
    for i in 0..<newl.count {
        for j in i+1..<newl.count {
            dNumber = lcm(dNumber, newl[j].1)
        }
    }
    newl.flatMap { result.append((dNumber * $0.0 / $0.1, dNumber)) }
    
    return result
}

convertFracts([(690, 1300), (87, 1310), (30, 40)])

