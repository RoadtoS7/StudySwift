//
//  TargetNumberSolution.swift
//  StudySwift
//
//  Created by nylah.j on 8/16/24.
//

import Foundation

final class TargetNumberSolution {
    func solution(_ numbers:[Int], _ target:Int) -> Int {
        let count: Int = numbers.count
        var memo = [String:Int] ()
        
        func dfs(_ cur: Int, _ i: Int) -> Int {
            let key: String = "\(cur),\(i)"
            if let cachedResult = memo[key] {
                return cachedResult
            }
            if i == count {
                return cur == target ? 1 : 0
            }
            let add = dfs(cur + numbers[i], i + 1)
            let substract = dfs(cur - numbers[i], i + 1)
            memo[key] = add + substract
            return add + substract
        }
        
        return dfs(0, 0)
    }
    
    func solution2(_ numbers:[Int], _ target:Int) -> Int {
        let count: Int = numbers.count
        var memo = [String: Int]()
        
        func dfs(_ cur: Int, _ i: Int) -> Int {
            let key = "\(cur),\(i)"
            if let cachedResult = memo[key] {
                return cachedResult
            }
            if i == count {
                return cur == target ? 1 : 0
            }
            let add = dfs(cur + numbers[i], i + 1)
            let subtract = dfs(cur - numbers[i], i + 1)
            memo[key] = add + subtract
            return add + subtract
        }
        
        return dfs(0, 0)
    }
    
    func searchTarget(number: [Int], target: Int, depth: Int, value: Int, answer: inout Int) {
        if depth >= number.count {
            if value == target {
                answer += 1
            }
            return
        }
        
        searchTarget(number: number, target: target, depth: depth+1, value: value + number[depth], answer: &answer)
        searchTarget(number: number, target: target, depth: depth+1, value: value - number[depth], answer: &answer)
    }
    
    func solution3(_ numbers: [Int], _ target: Int) -> Int {
        var answer: Int = 0
        searchTarget(number: numbers, target: target, depth: 0, value: 0, answer: &answer)
        return answer
    }
}
