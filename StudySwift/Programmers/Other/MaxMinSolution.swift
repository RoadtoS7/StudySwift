//
//  MaxMinSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/19/24.
//

import Foundation

final class MaxMinSolution {
    func solution(_ s:String) -> String {
        let numbers = s.split(separator: " ").compactMap { Int($0) }
        let max: Int = numbers.max()!
        let min: Int = numbers.min()!
        return "\(min) \(max)"
    }
}
