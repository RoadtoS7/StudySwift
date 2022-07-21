//
//  Reduce.swift
//  StudySwift
//
//  Created by nylah.j on 2022/05/12.
//

import Foundation

func reduceFirst() {
    let someNumbers: [Int] = [2, 8, 15]
    let sum: Int = someNumbers.reduce(0) { (first: Int, second: Int) -> Int in
        print("(\(first) + \(second))")
        return first + second
    }
    print(sum)
}

func reduceSecond() {
    let someNumbers: [Int] = [2, 8, 15]
    let sum = someNumbers.reduce(0, +)
    print(sum)
}
