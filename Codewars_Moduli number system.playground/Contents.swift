
import UIKit

//func findGCD(divident: Int, divisor: Int) -> Int {
//
//    return divisor == 0 ? divisor : findGCD(divident: divisor, divisor: divident % divisor)
//}
//
//func fromNb2Str(_ n: Int, _ sys: [Int]) -> String {
//    guard sys.reduce(1, * ) > n else {
//        return "Not applicable"
//    }
//
//    var gcd: Int = 1
//
//    for i in 0..<sys.count {
//        for j in i+1..<sys.count {
//
//            gcd = sys[i] >= sys[j] ?
//                findGCD(divident: sys[i], divisor: sys[j]) : findGCD(divident: sys[j], divisor: sys[i])
//
//            if gcd != 1 {
//                return "Not applicable"
//            }
//        }
//    }
//
//    return sys.flatMap { "-\(String(n % $0))-" }.joined()
//}


func gcd(_ a: Int, _ b: Int) -> Int {
    return b == 0 ? a : gcd(b, a % b)
}

func fromNb2Str(_ n: Int, _ sys: [Int]) -> String {
    guard n < sys.reduce(1,*) else { return "Not applicable" }
    
    for i in 0...sys.count-1{
        let gcdproduct = sys.map{gcd($0,sys[i])}.reduce(1,*)
        if sys[i] != gcdproduct { return "Not applicable" }
        
    }
    
    return sys.map{"-"+String(n % $0)+"-"}.joined()
}

fromNb2Str(11, [2,3,5])
