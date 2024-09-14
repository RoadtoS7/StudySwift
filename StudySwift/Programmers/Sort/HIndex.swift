//
//  HIndex.swift
//  StudySwift
//
//  Created by nylah.j on 9/14/24.
//

import Foundation

final class HIndex {
    func solution(_ citations:[Int]) -> Int {
        let sorted = citations.sorted {
            $0 > $1
        }
        if sorted.first! == .zero {
            return sorted.first!
        }
        
        let count = sorted.count
        var h = count
        for i in 0..<count {
            if h > sorted[i] {
                if i >= h {
                    return h
                } else {
                    h = sorted[i]
                }
            }
        }
        
        if h >= count {
            return count
        } else {
            return h
        }
    }
    
    func solution2(_ citations: [Int]) -> Int {
        let citations = citations.sorted(by: >)
        var result = 0
        
        
        for i in 0..<citations.count {
            let countBiggerThanH = i + 1
            if countBiggerThanH <= citations[i] {
                result = countBiggerThanH
            } else {
                break
            }
            
        }
        return result
    }
    
    static func test() {
        [
            [3, 0, 6, 1, 5],
            [0, 0, 0, 0, 0],
            [5,5, 5, 5],
            [1, 2, 3, 4, 5]
        ].forEach { arr in
            let result = HIndex().solution2(arr)
            print(result)
        }
    }
}
