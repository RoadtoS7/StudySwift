//
//  main.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation
import Combine

let result1 = NetworkSolution().solutionDFS(3, [[1, 1, 0], [1, 1, 0], [0, 0, 1]])
let result2 = NetworkSolution().solutionDFS(3, [[1, 1, 0], [1, 1, 1], [0, 1, 1]])

print("$$ result1: ", result1)
print("$$ result2: ", result2)
