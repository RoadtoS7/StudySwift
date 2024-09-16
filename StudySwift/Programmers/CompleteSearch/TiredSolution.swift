//
//  TiredSolution.swift
//  StudySwift
//
//  Created by nylah.j on 9/16/24.
//

import Foundation

final class TiredSolution {
    var maxCount: Int = 0
    var queue: [Int] = []
    
    func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
        
        var visitied: [Bool] = .init(repeating: false, count: dungeons.count)
        exploreAll(dungeons, visited: &visitied, k: k, count: 0)
        return maxCount
    }
    
    func exploreAll(_ dungeons: [[Int]], visited: inout [Bool], k: Int, count: Int) {
        for (i, dungeon) in dungeons.enumerated() {
            let (minNeed, cost) = (dungeon[0], dungeon[1])
            
            guard visited[i] == false else {
                continue
            }
                  
            
            guard k >= minNeed,
                  k >= cost else {
                maxCount = max(maxCount, count)
                continue
            }
            
            if count + 1 == dungeons.count {
                maxCount = (count + 1)
                return
            }
            
            visited[i] = true
            queue.append(i)
            exploreAll(dungeons, visited: &visited, k: k - cost, count: count + 1)
            queue.removeLast()
            visited[i] = false
        }
    }
    
    static func test() {
        print(TiredSolution().solution(80, [[80,20],[50,40],[30,10]]))
    }
}
