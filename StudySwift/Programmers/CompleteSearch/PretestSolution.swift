//
//  PretestSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/16/24.
//

import Foundation

final class PretestSolution {
    func solution(_ answers:[Int]) -> [Int] {
        let person1 = [1, 2, 3, 4, 5]
        let person1Score = score(pattern: person1, answer: answers)
        
        let person2 = [2, 1, 2, 3, 2, 4, 2, 5]
        let person2Score = score(pattern: person2, answer: answers)
        
        let person3 = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
        let person3Score = score(pattern: person3, answer: answers)
        
        let scores = [person1Score, person2Score, person3Score]
        let maxScore = scores.max()
       
        var result: [Int] = []
        for (i, score) in scores.enumerated() {
            if maxScore == score {
                result.append(i + 1)
            }
        }

        return result
    }
    
    func score(pattern: [Int], answer: [Int]) -> Int {
        let person1Count = pattern.count
        var score = 0

        for (i, answer) in answer.enumerated() {
            let index = i % person1Count
            
            if pattern[index] == answer {
                score += 1
            }
        }
        
        return score
    }
    
    static func test() {
        [
            [1,2,3,4,5],
            [1,3,2,4,2]
        ].forEach { ids in
            print(PretestSolution().solution(ids))
        }
    }
}
