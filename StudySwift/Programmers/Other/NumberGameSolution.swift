//
//  NumberGameSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/19/24.
//

import Foundation

final class NumberGameSolution {
    func solution(_ a:[Int], _ b:[Int]) -> Int {
        let a = a.sorted()
        let b = b.sorted()
        let n = a.count
        
        var result: Int = 0
        var j: Int = 0
        for i in 0...n-2 {
            while j < n {
                if a[i] < b[j] {
                    result += 1
                    j += 1
                    break
                } else {
                    j += 1
                }
            }
        }
        
        return result
    }
    
    static func test() {
        [
            ([5,1,3,7],    [2,2,6,8]),
            ([2,2,2,2],    [1,1,1,1])
        ].forEach {
            print(NumberGameSolution().solution($0, $1))
        }
    }
}
