//
//  TheBiggestNumber.swift
//  StudySwift
//
//  Created by nylah.j on 8/5/24.
//

import Foundation

class TheBiggestNumber {
    func solution(_ numbers:[Int]) -> String {
        let sortedNumbers = numbers.sorted {
            Int("\($0)\($1)")! > Int("\($1)\($0)")!
        }
        let result = sortedNumbers.map { String($0) }
            .reduce("") { $0 + $1 }
        return sortedNumbers.first == 0 ? "0" : result
    }
}
