//
//  main.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation
import Combine

let sample: Dictionary<Int, [[Int]]> = [
    9 : [[1,3],[2,3],[3,4],[4,5],[4,6],[4,7],[7,8],[7,9]],
    4 : [[1,2],[2,3],[3,4]],
    7 : [[1,2],[2,7],[3,7],[3,4],[4,5],[6,7]]
]

let numbers: [[Int]] = [
    [1, 1, 1, 1, 1],
    [4, 1, 2, 1]
]

let target : [Int] = [
    3, 4
]



    
let result1 = TargetNumberSolution().solution3([1, 1, 1, 1, 1], 3)
let result2 = TargetNumberSolution().solution3([4, 1, 2, 1], 4)
print(result1)
print(result2)

