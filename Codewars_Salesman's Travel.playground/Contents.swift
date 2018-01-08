//: Playground - noun: a place where people can play

import UIKit

//func travel(_ r: String, zipcode: String) -> String {
//    let addressArray = r.components(separatedBy: ",")
//    var frontCodes: [String] = []
//    let matches = addressArray.flatMap ({ address -> String? in
//        let addressCompnents = address.components(separatedBy: .whitespaces)
//        var result = ""
//
//        if let code = zipcode.components(separatedBy: .whitespaces).last, addressCompnents.contains(code) {
//            result = addressCompnents.dropFirst().dropLast(2).joined(separator: " ")
//            if let code = addressCompnents.first {
//                frontCodes.append(code)
//            }
//        }
//        return result
//    }).filter { $0 != "" }
//
//    return zipcode + ":\(matches.joined(separator: ","))/\(frontCodes.joined(separator: ","))"
//
//}


func travel(_ r: String, zipcode: String) -> String {
    let data = r.components(separatedBy: ",")
    let results = data.filter{ $0.hasSuffix(zipcode) }
    let houses = results.map{ $0.components(separatedBy: " ")[0] }
    let streets = results.map { $0.components(separatedBy: " ").dropFirst().dropLast().dropLast().joined(separator: " ") }
    return "\(zipcode):\(streets.joined(separator: ","))/\(houses.joined(separator: ","))"
}
