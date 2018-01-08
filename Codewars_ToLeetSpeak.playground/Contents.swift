//: Playground - noun: a place where people can play

import UIKit

//func toLeetSpeak(_ s : String) -> String {
//
//    let dict: [Character:Character] = [
//        "A" : "@",
//        "B" : "8",
//        "C" : "(",
//        "D" : "D",
//        "E" : "3",
//        "F" : "F",
//        "G" : "6",
//        "H" : "#",
//        "I" : "!",
//        "J" : "J",
//        "K" : "K",
//        "L" : "1",
//        "M" : "M",
//        "N" : "N",
//        "O" : "0",
//        "P" : "P",
//        "Q" : "Q",
//        "R" : "R",
//        "S" : "$",
//        "T" : "7",
//        "U" : "U",
//        "V" : "V",
//        "W" : "W",
//        "X" : "X",
//        "Y" : "Y",
//        "Z" : "2"
//    ]
//
//    var newS = String()
//
//    for c in s.characters {
//        if let newC = dict[c] {
//            newS.append(newC)
//        } else {
//            newS.append(c)
//        }
//    }
//
//    return newS
//}


let characters: [Character: Character] = [
    " ": " ",
    "A": "@",
    "B": "8",
    "C": "(",
    "D": "D",
    "E": "3",
    "F": "F",
    "G": "6",
    "H": "#",
    "I": "!",
    "J": "J",
    "K": "K",
    "L": "1",
    "M": "M",
    "N": "N",
    "O": "0",
    "P": "P",
    "Q": "Q",
    "R": "R",
    "S": "$",
    "T": "7",
    "U": "U",
    "V": "V",
    "W": "W",
    "X": "X",
    "Y": "Y",
    "Z": "2",
]

func toLeetSpeak(_ s : String) -> String {
    return String(s.characters.flatMap{ characters[$0] })
}
