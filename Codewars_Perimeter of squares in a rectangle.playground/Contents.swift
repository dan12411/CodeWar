import UIKit

func memoize<T: Hashable, U>(work: @escaping ((T)->U, T) -> U) -> (T)->U {
    var memo = Dictionary<T, U>()
    
    func wrap(x: T)->U {
        if let q = memo[x] { return q }
        let r = work(wrap, x)
        memo[x] = r
        return r
    }
    
    return wrap
}

//func memoize<T: Hashable, U>(work: @escaping (T)->U) -> (T)->U {
//    var memo = Dictionary<T, U>()
//
//    return { x in
//        if let q = memo[x] { return q }
//        let r = work(x)
//        memo[x] = r
//        return r
//    }
//}

//func fibonacci(_ n: UInt64) -> UInt64 {
//    return n < 2 ? n : fibonacci(n-1) + fibonacci(n-2)
//}

let fibonacci = memoize { (fibonacci, i) in
    i < 2 ? i : fibonacci(i-1) + fibonacci(i-2)
}

func perimeter(_ n: UInt64) -> UInt64 {
    var fibonacciArray: Array<UInt64> = []
    fibonacciArray.reserveCapacity(Int(n+1))
    for i in 1...n+1 {
        fibonacciArray.append(UInt64(fibonacci(Int(i))))
    }
    
    return 4 * fibonacciArray.reduce(0, +)
}

perimeter(55)
