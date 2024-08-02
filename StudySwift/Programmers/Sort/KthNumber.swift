//
//  KthNumber.swift
//  StudySwift
//
//  Created by nylah.j on 8/2/24.
//

import Foundation

struct KthNumber {
    static func solution() {
        let array = [1, 5, 2, 6, 3, 7, 4]
        let commands = [[2, 5, 3], [4, 4, 1], [1, 7, 3]]

        let result = solution(array, commands)
        print("$$ result: ", result)
    }
    
    // command의 각 원소에 대한 설명이 없다.
    private static func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
        var result: [Int] = []
        
        for command in commands {
            let i = command[0]
            let j = command[1]
            let k = command[2]
            
            var splitted = array[i-1..<j]
            splitted.sort()
            
            result.append(splitted[(i-1) + (k-1)])
        }
        return result
    }
}
