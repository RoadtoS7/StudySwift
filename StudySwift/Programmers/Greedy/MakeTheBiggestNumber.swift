//
//  MakeTheBiggestNumber.swift
//  StudySwift
//
//  Created by nylah.j on 9/16/24.
//

import Foundation

final class MakeTheBiggestNumber {
    func solution(_ number:String, _ k:Int) -> String {
        let number = number.compactMap { Int(String($0)) }
        var result: [Int] = []
        var removeCount: Int = 0
        
        
        for num in number {
            while removeCount < k {
                if let last = result.last, last < num {
                    result.popLast()
                    removeCount += 1
                } else {
                    break
                }
            }
            
            result.append(num)
        }
        
        return result[0..<result.count - (k - removeCount)].map { "\($0)" }.joined()
    }
    
    static func test() {
        [
            ("1924", 2),
            ("1231234", 3),
            ("4177252841",4),
        ].forEach {
            print(MakeTheBiggestNumber().solution($0, $1))
        }
        
    }
}
