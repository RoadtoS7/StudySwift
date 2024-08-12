//
//  MinimumSquare.swift
//  StudySwift
//
//  Created by nylah.j on 8/7/24.
//

import Foundation

final class MinimumSquare {
    static func solution(_ sizes: [[Int]]) -> Int {
        let count = sizes.count
        var i = 0
        var candidates: [Int] = []
        
        func find(widths: [Int], heights: [Int], _ i: Int) {
            if i == count {
                let bigWidth = widths.sorted { $0 > $1 }.first!
                let bigHeight = heights.sorted { $0 > $1 }.first!
                candidates.append(bigWidth * bigHeight)
                return
            }
            
            let width = sizes[i][0]
            let height = sizes[i][1]
            find(widths: widths + [width], heights: heights + [height], i + 1)
            find(widths: widths + [height], heights: heights + [width], i + 1)
        }
        
        find(widths: [], heights: [], i)
        return candidates.sorted().first!
    }
}
