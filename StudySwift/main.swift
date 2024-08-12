//
//  main.swift
//  StudySwift
//
//  Created by nylah.j on 2022/02/15.
//

import Foundation
import Combine

let sizes = [
    [60, 50],
    [30, 70],
    [60, 30],
    [80, 40]
]

let result1 = FindPrimes().solution("17")
let result2 = FindPrimes().solution("011")
print("$$ result1: ", result1)
print("$$ result2: ", result2)

