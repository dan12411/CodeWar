import UIKit

func ann(_ n : Int) -> [Int] {
    
    var result: Array<Int> = [1]
    var sumAnn = 1
    result.reserveCapacity(n)
    
    guard n > 0 else { return result }
    
    let t = ann(n-1)[n-1]
//    print("ann't \(t)")
    let b = n-john(t)[t]
    print("ann'b \(b)")
    sumAnn += b
    Array(1..<n).map { _ in result.append(b) }
    
    return result
}

func john(_ n : Int) -> [Int] {
    var result: Array<Int> = [0]
    result.reserveCapacity(n)
    
    guard n > 0 else { return result }
    
    let t = john(n-1)[n-1]
//    print("john't \(t)")
    let b = n-ann(t)[t]
    print("john'b \(b)")
    Array(1..<n).map { _ in result.append(b) }
    
    return result
}

func sumJohn(_ n : Int) -> Int {
    return 0
}

func sumAnn(_ n : Int) -> Int {
    return 0
}

ann(2)
