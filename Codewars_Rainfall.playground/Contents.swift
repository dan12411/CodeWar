//: Playground - noun: a place where people can play

import UIKit

//func mean(_ d : String, _ town: String) -> Double {
//
//    let filteredTown = d.components(separatedBy: "\n")
//        .lazy
//        .filter { $0.contains(town) }
//        .first
//
//    guard let targetTown = filteredTown else {
//        return -1
//    }
//
//    let digitData = targetTown
//        .components(separatedBy: ":")[1]
//        .components(separatedBy: ",")
//        .flatMap { $0.components(separatedBy: " ") }
//        .filter { $0.rangeOfCharacter(from: .decimalDigits) != nil }
//        .flatMap { Double($0) }
//
//    return digitData.reduce(0, +) / Double(digitData.count)
//}

//func variance(_ d : String, _ town: String) -> Double {
//
//    let filteredTown = d.components(separatedBy: "\n")
//        .lazy
//        .filter { $0.contains(town) }
//        .first
//
//    guard let targetTown = filteredTown else {
//        return -1
//    }
//
//    let digitData = targetTown
//        .components(separatedBy: ":")[1]
//        .components(separatedBy: ",")
//        .flatMap { $0.components(separatedBy: " ") }
//        .filter { $0.rangeOfCharacter(from: .decimalDigits) != nil }
//        .flatMap { Double($0) }
//
//    let mean = digitData.reduce(0, +) / Double(digitData.count)
//
//    return digitData.flatMap { pow(($0 - mean),2) }.reduce(0, +) / Double(digitData.count)
//}


func temperatures(fromData d: String, forCity town: String) -> [Double] {
    guard let record = d.components(separatedBy: "\n").first(where: { $0.hasPrefix("\(town):") }) else {
        return [Double]()
    }

    return record.components(separatedBy: ",").map { Double($0.components(separatedBy: " ")[1])! }
}

func mean(_ d : String, _ town: String) -> Double {
    let temps = temperatures(fromData: d, forCity: town)
    return temps.isEmpty ? -1 : temps.reduce(0, +) / Double(temps.count)
}

func variance(_ d : String, _ town: String) -> Double {
    let meanVal = mean(d, town)
    let temps = temperatures(fromData: d, forCity: town)
    
    return temps.isEmpty ? -1 : temps.map { pow($0 - meanVal, 2) }.reduce(0, +) / Double(temps.count)
}

let d = "Rome:Jan 81.2,Feb 63.2,Mar 70.3,Apr 55.7,May 53.0,Jun 36.4,Jul 17.5,Aug 27.5,Sep 60.9,Oct 117.7,Nov 111.0,Dec 97.9" + "\n" +
    "London:Jan 48.0,Feb 38.9,Mar 39.9,Apr 42.2,May 47.3,Jun 52.1,Jul 59.5,Aug 57.2,Sep 55.4,Oct 62.0,Nov 59.0,Dec 52.9" + "\n" +
"Paris:Jan 182.3,Feb 120.6,Mar 158.1,Apr 204.9,May 323.1,Jun 300.5,Jul 236.8,Aug 192.9,Sep 66.3,Oct 63.3,Nov 83.2,Dec 154.7"

//mean(d, "London")

variance(d, "London")
