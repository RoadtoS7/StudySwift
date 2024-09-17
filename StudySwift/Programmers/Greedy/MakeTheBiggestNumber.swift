////
////  MakeTheBiggestNumber.swift
////  StudySwift
////
////  Created by nylah.j on 9/16/24.
////
//
//import Foundation
//
//final class MakeTheBiggestNumber {
//    func solution(_ number:String, _ k:Int) -> String {
//        
//        var count = 0
//        var numberChars: [Character] = number.map { $0 }
//        
//        func remove() {
//            // 가장 큰 숫자인지를 어떻게 알지?
//            // 가장 큰
//            for i in 0...<numberChars.count {
//                
//            }
//        }
//        
//        ///
//        let number: [Int] = number.compactMap { (numberLit: Character) in
//            Int(String(numberLit))
//        }.sorted(by: >)
//        
//        let until: Int = number.count - k
//        let result = number[0..<until].reduce("") { partialResult, number in
//            "\(partialResult)\(number)"
//        }
//        return result
//    }
//    
//    static func test() {
//        [
//            ("1924", 2),
//            ("1231234", 3),
//            ("4177252841",4),
//        ].forEach {
//            print(MakeTheBiggestNumber().solution($0, $1))
//        }
//        
//    }
//}
