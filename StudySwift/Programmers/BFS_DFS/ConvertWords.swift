//
//  ConvertWords.swift
//  StudySwift
//
//  Created by nylah.j on 8/18/24.
//

import Foundation

final class ConvertWords {
    var visited: [Bool] = .init()
    var memo: [String:Int] = [:]
    
    var result: Int = .max
    
    func solution(T_ begin:String, _ target:String, _ words:[String]) -> Int {
        guard words.contains(target) else {
            return .zero
        }
        
        visited = .init(repeating: false, count: words.count)
        visit(begin, words: words, target: target, count: 0)
        return result
    }
    
    func visit(_ word: String, words: [String], target: String, count: Int) {
        if let minCount = memo[word] {
            memo[word] = min(minCount, count)
        } else {
            memo[word] = count
        }
        
        // 최소 몇단계인가
        for (index, cur) in words.enumerated() {
            let diffCount: Int = zip(word, cur).filter{$0 != $1}.map { $0.0 }.count
            // 방문 가능함
            if diffCount == 1, visited[index] == false {
                if cur == target {
                    result = min(result, count + 1)
                    return
                }
                
                visited[index] = true
                visit(cur, words: words, target: target, count: count + 1)
                visited[index] = false
            }
        }
    }
}
