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
    
    func solution2(_ begin:String, _ target:String, _ words:[String]) -> Int {
        // 몇단개를 거칠 수 있는가?
        // 알파벳이 한개가 차이나는가를 어떻게 알아..?
        guard words.contains(target) else {
            return 0
        }
        
        let words = words + [begin]
        var network: [String: [String]] = [:]
        
        for i in 0..<words.count {
            for j in 0..<words.count {
                if words[i] != words[j], diffCount(words[i], words[j]) == 1 {
                    network[words[i], default: []].append(words[j])
                    network[words[j], default: []].append(words[i])
                }
            }
        }
        
        var visited: [String:Bool] = words.reduce(into: [String:Bool]()) { partialResult, word in
            partialResult[word] = false
        }
        
        var minCount: Int = .max
        var needToVisit = [(begin, 0, visited)]
        while needToVisit.isEmpty == false {
            var (node, count, visited): (String, Int, [String:Bool]) = needToVisit.removeFirst()
            if node == target {
                minCount = min(minCount, count)
                continue
            }
            
            for willVisit in network[node, default: []] {
                if visited[willVisit] == false {
                    visited[willVisit] = true
                    needToVisit.append((willVisit, count + 1, visited))
                }
            }
        }
        
        return minCount == .max ? 0 : minCount
    }
    
    private func diffCount(_ word1: String, _ word2: String) -> Int {
        let w1 = Array(word1)
        let w2 = Array(word2)
        return zip(w1, w2).filter { $0 != $1 }.count
    }
    
    static func test() {
        [
            ("hit",    "cog",    ["hot", "dot", "dog", "lot", "log", "cog"]),
            ("hit",   "cog",    ["hot", "dot", "dog", "lot", "log"])
        ].forEach {
            print(ConvertWords().solution2($0.0, $0.1, $0.2))
        }
    }
}
